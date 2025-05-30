using namespace System.Management.Automation
using namespace System.Management.Automation.Language

Register-ArgumentCompleter -Native -CommandName 'watchexec' -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)

    $commandElements = $commandAst.CommandElements
    $command = @(
        'watchexec'
        for ($i = 1; $i -lt $commandElements.Count; $i++) {
            $element = $commandElements[$i]
            if ($element -isnot [StringConstantExpressionAst] -or
                $element.StringConstantType -ne [StringConstantType]::BareWord -or
                $element.Value.StartsWith('-') -or
                $element.Value -eq $wordToComplete) {
                break
        }
        $element.Value
    }) -join ';'

    $completions = @(switch ($command) {
        'watchexec' {
            [CompletionResult]::new('-w', 'w', [CompletionResultType]::ParameterName, 'Watch a specific file or directory')
            [CompletionResult]::new('--watch', 'watch', [CompletionResultType]::ParameterName, 'Watch a specific file or directory')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Clear screen before running command')
            [CompletionResult]::new('--clear', 'clear', [CompletionResultType]::ParameterName, 'Clear screen before running command')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'What to do when receiving events while the command is running')
            [CompletionResult]::new('--on-busy-update', 'on-busy-update', [CompletionResultType]::ParameterName, 'What to do when receiving events while the command is running')
            [CompletionResult]::new('-s', 's', [CompletionResultType]::ParameterName, 'Send a signal to the process when it''s still running')
            [CompletionResult]::new('--signal', 'signal', [CompletionResultType]::ParameterName, 'Send a signal to the process when it''s still running')
            [CompletionResult]::new('--stop-signal', 'stop-signal', [CompletionResultType]::ParameterName, 'Signal to send to stop the command')
            [CompletionResult]::new('--stop-timeout', 'stop-timeout', [CompletionResultType]::ParameterName, 'Time to wait for the command to exit gracefully')
            [CompletionResult]::new('--map-signal', 'map-signal', [CompletionResultType]::ParameterName, 'Translate signals from the OS to signals to send to the command')
            [CompletionResult]::new('-d', 'd', [CompletionResultType]::ParameterName, 'Time to wait for new events before taking action')
            [CompletionResult]::new('--debounce', 'debounce', [CompletionResultType]::ParameterName, 'Time to wait for new events before taking action')
            [CompletionResult]::new('--delay-run', 'delay-run', [CompletionResultType]::ParameterName, 'Sleep before running the command')
            [CompletionResult]::new('--poll', 'poll', [CompletionResultType]::ParameterName, 'Poll for filesystem changes')
            [CompletionResult]::new('--shell', 'shell', [CompletionResultType]::ParameterName, 'Use a different shell')
            [CompletionResult]::new('--emit-events-to', 'emit-events-to', [CompletionResultType]::ParameterName, 'Configure event emission')
            [CompletionResult]::new('-E', 'E ', [CompletionResultType]::ParameterName, 'Add env vars to the command')
            [CompletionResult]::new('--env', 'env', [CompletionResultType]::ParameterName, 'Add env vars to the command')
            [CompletionResult]::new('--color', 'color', [CompletionResultType]::ParameterName, 'When to use terminal colours')
            [CompletionResult]::new('--project-origin', 'project-origin', [CompletionResultType]::ParameterName, 'Set the project origin')
            [CompletionResult]::new('--workdir', 'workdir', [CompletionResultType]::ParameterName, 'Set the working directory')
            [CompletionResult]::new('-e', 'e', [CompletionResultType]::ParameterName, 'Filename extensions to filter to')
            [CompletionResult]::new('--exts', 'exts', [CompletionResultType]::ParameterName, 'Filename extensions to filter to')
            [CompletionResult]::new('-f', 'f', [CompletionResultType]::ParameterName, 'Filename patterns to filter to')
            [CompletionResult]::new('--filter', 'filter', [CompletionResultType]::ParameterName, 'Filename patterns to filter to')
            [CompletionResult]::new('--filter-file', 'filter-file', [CompletionResultType]::ParameterName, 'Files to load filters from')
            [CompletionResult]::new('-i', 'i', [CompletionResultType]::ParameterName, 'Filename patterns to filter out')
            [CompletionResult]::new('--ignore', 'ignore', [CompletionResultType]::ParameterName, 'Filename patterns to filter out')
            [CompletionResult]::new('--ignore-file', 'ignore-file', [CompletionResultType]::ParameterName, 'Files to load ignores from')
            [CompletionResult]::new('--fs-events', 'fs-events', [CompletionResultType]::ParameterName, 'Filesystem events to filter to')
            [CompletionResult]::new('--log-file', 'log-file', [CompletionResultType]::ParameterName, 'Write diagnostic logs to a file')
            [CompletionResult]::new('--completions', 'completions', [CompletionResultType]::ParameterName, 'Generate a shell completions script')
            [CompletionResult]::new('-W', 'W ', [CompletionResultType]::ParameterName, 'Deprecated alias for ''--on-busy-update=do-nothing''')
            [CompletionResult]::new('--watch-when-idle', 'watch-when-idle', [CompletionResultType]::ParameterName, 'Deprecated alias for ''--on-busy-update=do-nothing''')
            [CompletionResult]::new('-r', 'r', [CompletionResultType]::ParameterName, 'Restart the process if it''s still running')
            [CompletionResult]::new('--restart', 'restart', [CompletionResultType]::ParameterName, 'Restart the process if it''s still running')
            [CompletionResult]::new('-k', 'k', [CompletionResultType]::ParameterName, 'Hidden legacy shorthand for ''--signal=kill''')
            [CompletionResult]::new('--kill', 'kill', [CompletionResultType]::ParameterName, 'Hidden legacy shorthand for ''--signal=kill''')
            [CompletionResult]::new('--stdin-quit', 'stdin-quit', [CompletionResultType]::ParameterName, 'Exit when stdin closes')
            [CompletionResult]::new('--no-vcs-ignore', 'no-vcs-ignore', [CompletionResultType]::ParameterName, 'Don''t load gitignores')
            [CompletionResult]::new('--no-project-ignore', 'no-project-ignore', [CompletionResultType]::ParameterName, 'Don''t load project-local ignores')
            [CompletionResult]::new('--no-global-ignore', 'no-global-ignore', [CompletionResultType]::ParameterName, 'Don''t load global ignores')
            [CompletionResult]::new('--no-default-ignore', 'no-default-ignore', [CompletionResultType]::ParameterName, 'Don''t use internal default ignores')
            [CompletionResult]::new('--no-discover-ignore', 'no-discover-ignore', [CompletionResultType]::ParameterName, 'Don''t discover ignore files at all')
            [CompletionResult]::new('--ignore-nothing', 'ignore-nothing', [CompletionResultType]::ParameterName, 'Don''t ignore anything at all')
            [CompletionResult]::new('-p', 'p', [CompletionResultType]::ParameterName, 'Wait until first change before running command')
            [CompletionResult]::new('--postpone', 'postpone', [CompletionResultType]::ParameterName, 'Wait until first change before running command')
            [CompletionResult]::new('-n', 'n', [CompletionResultType]::ParameterName, 'Don''t use a shell')
            [CompletionResult]::new('--no-shell-long', 'no-shell-long', [CompletionResultType]::ParameterName, 'Don''t use a shell')
            [CompletionResult]::new('--no-environment', 'no-environment', [CompletionResultType]::ParameterName, 'Shorthand for ''--emit-events=none''')
            [CompletionResult]::new('--only-emit-events', 'only-emit-events', [CompletionResultType]::ParameterName, 'Only emit events to stdout, run no commands')
            [CompletionResult]::new('--no-process-group', 'no-process-group', [CompletionResultType]::ParameterName, 'Don''t use a process group')
            [CompletionResult]::new('-1', '1', [CompletionResultType]::ParameterName, 'Testing only: exit Watchexec after the first run')
            [CompletionResult]::new('-N', 'N ', [CompletionResultType]::ParameterName, 'Alert when commands start and end')
            [CompletionResult]::new('--notify', 'notify', [CompletionResultType]::ParameterName, 'Alert when commands start and end')
            [CompletionResult]::new('--timings', 'timings', [CompletionResultType]::ParameterName, 'Print how long the command took to run')
            [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Don''t print starting and stopping messages')
            [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Don''t print starting and stopping messages')
            [CompletionResult]::new('--bell', 'bell', [CompletionResultType]::ParameterName, 'Ring the terminal bell on command completion')
            [CompletionResult]::new('--no-meta', 'no-meta', [CompletionResultType]::ParameterName, 'Don''t emit fs events for metadata changes')
            [CompletionResult]::new('--print-events', 'print-events', [CompletionResultType]::ParameterName, 'Print events that trigger actions')
            [CompletionResult]::new('-v', 'v', [CompletionResultType]::ParameterName, 'Set diagnostic log level')
            [CompletionResult]::new('--verbose', 'verbose', [CompletionResultType]::ParameterName, 'Set diagnostic log level')
            [CompletionResult]::new('--manual', 'manual', [CompletionResultType]::ParameterName, 'Show the manual page')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
    })

    $completions.Where{ $_.CompletionText -like "$wordToComplete*" } |
        Sort-Object -Property ListItemText
}
