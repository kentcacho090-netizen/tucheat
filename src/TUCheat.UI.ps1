Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object Windows.Forms.Form
$form.Text = 'TUCheat Control Panel'
$form.Size = New-Object Drawing.Size(760,520)
$form.StartPosition = 'CenterScreen'
$form.MinimumSize = New-Object Drawing.Size(680,460)

$title = New-Object Windows.Forms.Label
$title.Text = 'TUCheat'
$title.Font = New-Object Drawing.Font('Segoe UI',22,[Drawing.FontStyle]::Bold)
$title.Location = New-Object Drawing.Point(24,20)
$title.AutoSize = $true
$form.Controls.Add($title)

$status = New-Object Windows.Forms.Label
$status.Text = 'Status: Ready'
$status.Location = New-Object Drawing.Point(28,68)
$status.AutoSize = $true
$form.Controls.Add($status)

$start = New-Object Windows.Forms.Button
$start.Text = 'Start Test'
$start.Location = New-Object Drawing.Point(28,105)
$start.Size = New-Object Drawing.Size(130,40)
$start.Add_Click({ $status.Text = 'Status: Test mode running'; $log.AppendText(('[' + (Get-Date -Format HH:mm:ss) + '] Test mode started' + [Environment]::NewLine)) })
$form.Controls.Add($start)

$stop = New-Object Windows.Forms.Button
$stop.Text = 'Stop'
$stop.Location = New-Object Drawing.Point(170,105)
$stop.Size = New-Object Drawing.Size(130,40)
$stop.Add_Click({ $status.Text = 'Status: Stopped'; $log.AppendText(('[' + (Get-Date -Format HH:mm:ss) + '] Stopped' + [Environment]::NewLine)) })
$form.Controls.Add($stop)

$group = New-Object Windows.Forms.GroupBox
$group.Text = 'Configuration'
$group.Location = New-Object Drawing.Point(28,165)
$group.Size = New-Object Drawing.Size(320,150)
$form.Controls.Add($group)

$intervalLabel = New-Object Windows.Forms.Label
$intervalLabel.Text = 'Test interval (ms):'
$intervalLabel.Location = New-Object Drawing.Point(16,32)
$intervalLabel.AutoSize = $true
$group.Controls.Add($intervalLabel)

$interval = New-Object Windows.Forms.NumericUpDown
$interval.Minimum = 100
$interval.Maximum = 60000
$interval.Value = 1000
$interval.Location = New-Object Drawing.Point(16,58)
$group.Controls.Add($interval)

$mode = New-Object Windows.Forms.CheckBox
$mode.Text = 'Local simulation mode'
$mode.Checked = $true
$mode.Location = New-Object Drawing.Point(16,95)
$mode.AutoSize = $true
$group.Controls.Add($mode)

$logLabel = New-Object Windows.Forms.Label
$logLabel.Text = 'Activity'
$logLabel.Location = New-Object Drawing.Point(375,165)
$logLabel.AutoSize = $true
$form.Controls.Add($logLabel)

$log = New-Object Windows.Forms.TextBox
$log.Multiline = $true
$log.ScrollBars = 'Vertical'
$log.ReadOnly = $true
$log.Location = New-Object Drawing.Point(375,190)
$log.Size = New-Object Drawing.Size(350,220)
$form.Controls.Add($log)

$info = New-Object Windows.Forms.Label
$info.Text = 'Local simulation only; no game-client automation is enabled.'
$info.Location = New-Object Drawing.Point(28,345)
$info.AutoSize = $true
$form.Controls.Add($info)

$form.Add_Shown({ $form.Activate() })
[Windows.Forms.Application]::Run($form)
