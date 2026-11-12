# Guard for criteria files.
# brain/criteria and brain/anchor can be written only while an approval is open
# (loop/approvals/OPEN exists, created by /approve).
# Runs as a PreToolUse hook for Write and Edit. Exit 2 blocks the tool call.

$raw = [Console]::In.ReadToEnd()
try { $data = $raw | ConvertFrom-Json } catch { exit 0 }

$path = $null
if ($data -and $data.tool_input) { $path = $data.tool_input.file_path }
if (-not $path) { exit 0 }

$norm = ($path -replace '\\', '/')
if ($norm -notmatch '(^|/)brain/(criteria|anchor)/') { exit 0 }

$root = $env:CLAUDE_PROJECT_DIR
if (-not $root) { $root = (Get-Location).Path }
if (Test-Path -LiteralPath (Join-Path $root 'loop/approvals/OPEN')) { exit 0 }

[Console]::Error.WriteLine('Blocked: brain/criteria and brain/anchor change only through /approve. Put the change in loop/proposals instead.')
exit 2
