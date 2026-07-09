param(
    [string]$Tectonic = "tectonic"
)

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$figuresDir = Join-Path $repoRoot "figures"
$outputDir = Join-Path $figuresDir "pdf"
$wrapperDir = Join-Path $repoRoot "output\figure_wrappers"

New-Item -ItemType Directory -Force -Path $outputDir | Out-Null
New-Item -ItemType Directory -Force -Path $wrapperDir | Out-Null

$figureFiles = Get-ChildItem -Path $figuresDir -Filter *.tex | Sort-Object Name

foreach ($figure in $figureFiles) {
    $name = [System.IO.Path]::GetFileNameWithoutExtension($figure.Name)
    $wrapperPath = Join-Path $wrapperDir ($name + ".tex")
    $wrapper = @"
\documentclass[tikz,border=4pt]{standalone}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{xcolor}
\usepackage{libertine}
\usepackage{fontawesome}
\usepackage{tikz}
\usetikzlibrary{arrows.meta,positioning,calc,fit,backgrounds}
\newcommand{\iconstream}{\faSignal}
\newcommand{\iconchip}{\faServer}
\newcommand{\iconbrain}{\faCubes}
\newcommand{\iconsearch}{\faSearch}
\newcommand{\icongear}{\faCogs}
\newcommand{\iconshield}{\faShield}
\newcommand{\iconeye}{\faEye}
\newcommand{\iconbolt}{\faBolt}
\newcommand{\iconrecycle}{\faRefresh}
\newcommand{\icondatabase}{\faDatabase}
\newcommand{\iconwarning}{\faWarning}
\newcommand{\iconcheck}{\faCheck}
\newcommand{\iconchart}{\faBarChart}
\begin{document}
\input{../../figures/$name}
\end{document}
"@
    Set-Content -LiteralPath $wrapperPath -Value $wrapper -Encoding UTF8

    & $Tectonic -X compile -o $outputDir $wrapperPath | Out-Host
}

Get-ChildItem -Path $outputDir -Filter *.pdf | Sort-Object Name | Select-Object Name, Length, LastWriteTime
