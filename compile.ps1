# Script de compilation locale du mémoire en LaTeX (pour Overleaf)
# Ce script utilise Pandoc pour convertir vos fichiers Markdown en code LaTeX propre.

# Configuration de l'encodage en UTF-8 pour éviter la corruption des accents
$OutputEncoding = [System.Text.Encoding]::UTF8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
[Console]::InputEncoding = [System.Text.Encoding]::UTF8

# Configuration des métadonnées du mémoire
$Title = "Jumeaux Numériques et Intelligence Artificielle Topologique : Vers une prédiction instantanée de la résilience et des émissions urbaines"
$Author = "Thomas Clerc"
$Date = "2026"
$TemplateFile = "template.tex"

# S'assurer que Pandoc est bien accessible dans le PATH
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","User") + ";" + [System.Environment]::GetEnvironmentVariable("Path","Machine")

if (!(Get-Command pandoc -ErrorAction SilentlyContinue)) {
    Write-Error "Pandoc n'a pas été trouvé sur votre système. Veuillez l'installer ou relancer le terminal."
    Exit 1
}

# Rechercher tous les fichiers Markdown correspondant au motif
$MarkdownFiles = Get-ChildItem -Path . -Filter "REDACTION_MEMOIRE_NOUVEAU*.md"

if ($MarkdownFiles.Count -eq 0) {
    Write-Error "Aucun fichier REDACTION_MEMOIRE_NOUVEAU*.md trouvé dans le dossier actuel."
    Exit 1
}

foreach ($File in $MarkdownFiles) {
    $SourceFile = $File.Name
    
    # Calculer le nom de sortie .tex correspondant
    # Exemple :
    # REDACTION_MEMOIRE_NOUVEAU.md -> memoire.tex
    # REDACTION_MEMOIRE_NOUVEAU (1).md -> memoire (1).tex
    if ($SourceFile -match "REDACTION_MEMOIRE_NOUVEAU\s*\(([^)]+)\)(.*)\.md") {
        $Index = $Matches[1]
        $Suffix = $Matches[2]
        $OutputFile = "memoire ($Index$Suffix).tex"
    } elseif ($SourceFile -match "REDACTION_MEMOIRE_NOUVEAU\.md") {
        $OutputFile = "memoire.tex"
    } else {
        $OutputFile = $SourceFile.Replace(".md", ".tex")
    }

    # Prétraitement automatique du fichier Markdown (Nettoyage et mise en page)
    $Content = Get-Content -Path $SourceFile -Encoding UTF8
    $NewContent = New-Object System.Collections.Generic.List[string]
    $Deleting = $false
    
    # Étape A : Supprimer la section 6.4 si présente et enlever les horizontal rules (---) devant les titres
    for ($i = 0; $i -lt $Content.Count; $i++) {
        $Line = $Content[$i]
        $Trimmed = $Line.Trim()
        
        # Supprimer section 6.4
        if ($Trimmed.StartsWith("### 6.4 ")) {
            $Deleting = $true
            continue
        }
        if ($Deleting) {
            if ($Trimmed.StartsWith("### 6.5 ") -or $Trimmed.StartsWith("### Modèle Mathématique de XGBoost")) {
                $Deleting = $false
            } else {
                continue
            }
        }
        
        # Supprimer "---" devant les titres
        if ($Trimmed -eq "---") {
            $NextHeading = $null
            for ($j = $i + 1; $j -lt $Content.Count; $j++) {
                $NextLine = $Content[$j].Trim()
                if ($NextLine -eq "") { continue }
                if ($NextLine -eq "\newpage" -or $NextLine -eq "\clearpage") { continue }
                if ($NextLine.StartsWith("#")) {
                    $NextHeading = $NextLine
                    break
                } else {
                    break
                }
            }
            if ($NextHeading -ne $null) {
                continue # Discard this --- line
            }
        }
        
        $NewContent.Add($Line)
    }
    
    # Étape B : Nettoyage de la numérotation H3+ et injection de \newpage avant H1/H2
    $FinalContent = New-Object System.Collections.Generic.List[string]
    for ($i = 0; $i -lt $NewContent.Count; $i++) {
        $Line = $NewContent[$i]
        $Trimmed = $Line.Trim()
        
        # Nettoyer la numérotation des sous-titres (H3, H4, H5)
        # if ($Line -match "^(#{3,})\s*(?:\d+\.\d+\.\d+|\d+\.\d+|\d+\.)\s*(.*)$") {
        #     $Line = "$($Matches[1]) $($Matches[2])"
        #     $Trimmed = $Line.Trim()
        # }
        
        # Insérer \newpage avant H1 et H2
        $IsChapterOrPart = $false
        if ($Trimmed.StartsWith("## Chapitre")) {
            $IsChapterOrPart = $true
        } elseif ($Trimmed.StartsWith("# ") -and -not $Trimmed.Contains("ÉCOLE HEXAGONE") -and -not $Trimmed.Contains("RAPPORT PROFESSIONNEL")) {
            $IsChapterOrPart = $true
        }
        
        if ($IsChapterOrPart) {
            $HasNewPageBefore = $false
            $PrevHeadingWasPart = $false
            $NewPageIndicesToRemove = New-Object System.Collections.Generic.List[int]
            
            # Rechercher la structure précédente dans FinalContent pour voir s'il y a déjà un saut de page ou une partie
            for ($j = $FinalContent.Count - 1; $j -ge 0; $j--) {
                $PrevLine = $FinalContent[$j].Trim()
                if ($PrevLine -eq "") { continue }
                if ($PrevLine -eq "\newpage" -or $PrevLine -eq "\clearpage") {
                    $HasNewPageBefore = $true
                    $NewPageIndicesToRemove.Add($j)
                    continue
                }
                if ($PrevLine.StartsWith("#")) {
                    if ($PrevLine.StartsWith("# ") -and -not $PrevLine.Contains("ÉCOLE HEXAGONE") -and -not $PrevLine.Contains("RAPPORT PROFESSIONNEL")) {
                        $PrevHeadingWasPart = $true
                    }
                    break
                } else {
                    break
                }
            }
            
            if ($Trimmed.StartsWith("## Chapitre") -and $PrevHeadingWasPart) {
                # Si le chapitre suit une partie, on supprime tout saut de page intermédiaire existant
                foreach ($idx in $NewPageIndicesToRemove) {
                    $FinalContent[$idx] = ""
                }
            } elseif (-not $HasNewPageBefore -and $FinalContent.Count -gt 0) {
                $FinalContent.Add("\newpage")
                $FinalContent.Add("")
            }
        }
        
        $FinalContent.Add($Line)
     }
    
    Set-Content -Path $SourceFile -Value $FinalContent -Encoding UTF8
    
    Write-Host "Compilation de $SourceFile vers $OutputFile en cours..." -ForegroundColor Cyan

    # Lancement de la conversion via Pandoc
    pandoc "$SourceFile" `
      --template=$TemplateFile `
      --standalone `
      --syntax-highlighting=none `
      --metadata-file=metadata.yaml `
      --toc `
      -o "$OutputFile"

    if ($LASTEXITCODE -eq 0) {
        Write-Host "Succès ! Le fichier '$OutputFile' a été mis à jour.`n" -ForegroundColor Green
    } else {
        Write-Error "Une erreur s'est produite lors de la compilation de $SourceFile."
    }
}

Write-Host "--------------------------------------------------------" -ForegroundColor Green
Write-Host "Toutes les compilations sont terminées !" -ForegroundColor Green
Write-Host "Vous pouvez importer les fichiers .tex générés dans Overleaf." -ForegroundColor Green
Write-Host "--------------------------------------------------------" -ForegroundColor Green
