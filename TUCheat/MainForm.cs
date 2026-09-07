using System;
using System.Drawing;
using System.Windows.Forms;

namespace TUCheat;

public sealed class MainForm : Form
{
    private readonly Label status;
    private readonly RichTextBox log;
    private readonly NumericUpDown interval;
    private readonly Timer timer;

    public MainForm()
    {
        Text = "TUCheat Control Panel";
        StartPosition = FormStartPosition.CenterScreen;
        MinimumSize = new Size(760, 500);
        Size = new Size(860, 580);
        Font = new Font("Segoe UI", 10F);

        var title = new Label { Text = "TUCheat", AutoSize = true, Location = new Point(30, 25), Font = new Font("Segoe UI", 25F, FontStyle.Bold) };
        var subtitle = new Label { Text = "Windows control panel", AutoSize = true, Location = new Point(34, 70) };
        status = new Label { Text = "Status: Ready", AutoSize = true, Location = new Point(34, 110), Font = new Font("Segoe UI", 11F, FontStyle.Bold) };

        var start = new Button { Text = "Start Test", Location = new Point(34, 150), Size = new Size(140, 42) };
        start.Click += (_, _) => StartTest();
        var stop = new Button { Text = "Stop", Location = new Point(185, 150), Size = new Size(140, 42) };
        stop.Click += (_, _) => StopTest();

        var group = new GroupBox { Text = "Configuration", Location = new Point(34, 215), Size = new Size(330, 155) };
        group.Controls.Add(new Label { Text = "Simulation interval (ms)", AutoSize = true, Location = new Point(18, 30) });
        interval = new NumericUpDown { Minimum = 100, Maximum = 60000, Value = 1000, Location = new Point(18, 58), Width = 120 };
        group.Controls.Add(interval);
        var simulation = new CheckBox { Text = "Local simulation mode", Checked = true, AutoSize = true, Location = new Point(18, 100) };
        group.Controls.Add(simulation);

        log = new RichTextBox { ReadOnly = true, Location = new Point(395, 215), Size = new Size(405, 255), Anchor = AnchorStyles.Top | AnchorStyles.Bottom | AnchorStyles.Left | AnchorStyles.Right };
        var activity = new Label { Text = "Activity", AutoSize = true, Location = new Point(395, 185) };
        Controls.AddRange(new Control[] { title, subtitle, status, start, stop, group, activity, log });

        timer = new Timer { Interval = 1000 };
        timer.Tick += (_, _) => WriteLog("Simulation tick");
        interval.ValueChanged += (_, _) => timer.Interval = (int)interval.Value;
        FormClosing += (_, _) => timer.Stop();
    }

    private void StartTest()
    {
        timer.Start();
        status.Text = "Status: Simulation running";
        WriteLog("Started local simulation");
    }

    private void StopTest()
    {
        timer.Stop();
        status.Text = "Status: Stopped";
        WriteLog("Stopped");
    }

    private void WriteLog(string message) => log.AppendText($"[{DateTime.Now:HH:mm:ss}] {message}{Environment.NewLine}");
}
