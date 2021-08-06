param($installPath, $toolsPath, $package, $project)

if ($project.Type -eq 'Web Site') {
    $projectDir = $project.Properties.Item('FullPath').Value

    $assemblyDestDir = Join-Path $projectDir 'bin/x86'
    if (!(Test-Path $assemblyDestDir)) {
        New-Item -ItemType Directory -Force -Path $assemblyDestDir
    }

    $assemblySourceFile = Join-Path $installPath 'runtimes/win-x86/native/libsass.dll'
    Copy-Item $assemblySourceFile $assemblyDestDir -Force
}