
using namespace System.Management.Automation
using namespace System.Management.Automation.Language

Register-ArgumentCompleter -Native -CommandName 'jj' -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)

    $commandElements = $commandAst.CommandElements
    $command = @(
        'jj'
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
        'jj' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('abandon', 'abandon', [CompletionResultType]::ParameterValue, 'Abandon a revision')
            [CompletionResult]::new('backout', 'backout', [CompletionResultType]::ParameterValue, 'Apply the reverse of a revision on top of another revision')
            [CompletionResult]::new('bookmark', 'bookmark', [CompletionResultType]::ParameterValue, 'Manage bookmarks')
            [CompletionResult]::new('branch', 'branch', [CompletionResultType]::ParameterValue, 'Manage bookmarks')
            [CompletionResult]::new('cat', 'cat', [CompletionResultType]::ParameterValue, 'Print contents of files in a revision')
            [CompletionResult]::new('checkout', 'checkout', [CompletionResultType]::ParameterValue, 'Create a new, empty change and edit it in the working copy (DEPRECATED, use `jj new`)')
            [CompletionResult]::new('chmod', 'chmod', [CompletionResultType]::ParameterValue, 'Sets or removes the executable bit for paths in the repo')
            [CompletionResult]::new('commit', 'commit', [CompletionResultType]::ParameterValue, 'Update the description and create a new change on top')
            [CompletionResult]::new('ci', 'ci', [CompletionResultType]::ParameterValue, 'Update the description and create a new change on top')
            [CompletionResult]::new('config', 'config', [CompletionResultType]::ParameterValue, 'Manage config options')
            [CompletionResult]::new('debug', 'debug', [CompletionResultType]::ParameterValue, 'Low-level commands not intended for users')
            [CompletionResult]::new('describe', 'describe', [CompletionResultType]::ParameterValue, 'Update the change description or other metadata')
            [CompletionResult]::new('desc', 'desc', [CompletionResultType]::ParameterValue, 'Update the change description or other metadata')
            [CompletionResult]::new('diff', 'diff', [CompletionResultType]::ParameterValue, 'Compare file contents between two revisions')
            [CompletionResult]::new('diffedit', 'diffedit', [CompletionResultType]::ParameterValue, 'Touch up the content changes in a revision with a diff editor')
            [CompletionResult]::new('duplicate', 'duplicate', [CompletionResultType]::ParameterValue, 'Create a new change with the same content as an existing one')
            [CompletionResult]::new('edit', 'edit', [CompletionResultType]::ParameterValue, 'Sets the specified revision as the working-copy revision')
            [CompletionResult]::new('evolog', 'evolog', [CompletionResultType]::ParameterValue, 'Show how a change has evolved over time')
            [CompletionResult]::new('evolution-log', 'evolution-log', [CompletionResultType]::ParameterValue, 'Show how a change has evolved over time')
            [CompletionResult]::new('file', 'file', [CompletionResultType]::ParameterValue, 'File operations')
            [CompletionResult]::new('files', 'files', [CompletionResultType]::ParameterValue, 'List files in a revision (DEPRECATED use `jj file list`)')
            [CompletionResult]::new('fix', 'fix', [CompletionResultType]::ParameterValue, 'Update files with formatting fixes or other changes')
            [CompletionResult]::new('git', 'git', [CompletionResultType]::ParameterValue, 'Commands for working with Git remotes and the underlying Git repo')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Create a new repo in the given directory')
            [CompletionResult]::new('interdiff', 'interdiff', [CompletionResultType]::ParameterValue, 'Compare the changes of two commits')
            [CompletionResult]::new('log', 'log', [CompletionResultType]::ParameterValue, 'Show revision history')
            [CompletionResult]::new('merge', 'merge', [CompletionResultType]::ParameterValue, 'Merge work from multiple bookmarks (DEPRECATED, use `jj new`)')
            [CompletionResult]::new('move', 'move', [CompletionResultType]::ParameterValue, 'Move changes from one revision into another (DEPRECATED, use `jj squash`)')
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new, empty change and (by default) edit it in the working copy')
            [CompletionResult]::new('next', 'next', [CompletionResultType]::ParameterValue, 'Move the working-copy commit to the child revision')
            [CompletionResult]::new('operation', 'operation', [CompletionResultType]::ParameterValue, 'Commands for working with the operation log')
            [CompletionResult]::new('op', 'op', [CompletionResultType]::ParameterValue, 'Commands for working with the operation log')
            [CompletionResult]::new('parallelize', 'parallelize', [CompletionResultType]::ParameterValue, 'Parallelize revisions by making them siblings')
            [CompletionResult]::new('prev', 'prev', [CompletionResultType]::ParameterValue, 'Change the working copy revision relative to the parent revision')
            [CompletionResult]::new('rebase', 'rebase', [CompletionResultType]::ParameterValue, 'Move revisions to different parent(s)')
            [CompletionResult]::new('resolve', 'resolve', [CompletionResultType]::ParameterValue, 'Resolve a conflicted file with an external merge tool')
            [CompletionResult]::new('restore', 'restore', [CompletionResultType]::ParameterValue, 'Restore paths from another revision')
            [CompletionResult]::new('revert', 'revert', [CompletionResultType]::ParameterValue, 'A dummy command that accepts any arguments')
            [CompletionResult]::new('root', 'root', [CompletionResultType]::ParameterValue, 'Show the current workspace root directory')
            [CompletionResult]::new('run', 'run', [CompletionResultType]::ParameterValue, '(**Stub**, does not work yet) Run a command across a set of revisions.')
            [CompletionResult]::new('show', 'show', [CompletionResultType]::ParameterValue, 'Show commit description and changes in a revision')
            [CompletionResult]::new('sparse', 'sparse', [CompletionResultType]::ParameterValue, 'Manage which paths from the working-copy commit are present in the working copy')
            [CompletionResult]::new('split', 'split', [CompletionResultType]::ParameterValue, 'Split a revision in two')
            [CompletionResult]::new('squash', 'squash', [CompletionResultType]::ParameterValue, 'Move changes from a revision into another revision')
            [CompletionResult]::new('status', 'status', [CompletionResultType]::ParameterValue, 'Show high-level repo status')
            [CompletionResult]::new('st', 'st', [CompletionResultType]::ParameterValue, 'Show high-level repo status')
            [CompletionResult]::new('tag', 'tag', [CompletionResultType]::ParameterValue, 'Manage tags')
            [CompletionResult]::new('util', 'util', [CompletionResultType]::ParameterValue, 'Infrequently used commands such as for generating shell completions')
            [CompletionResult]::new('undo', 'undo', [CompletionResultType]::ParameterValue, 'Undo an operation (shortcut for `jj op undo`)')
            [CompletionResult]::new('unsquash', 'unsquash', [CompletionResultType]::ParameterValue, 'Move changes from a revision''s parent into the revision')
            [CompletionResult]::new('untrack', 'untrack', [CompletionResultType]::ParameterValue, 'Stop tracking specified paths in the working copy')
            [CompletionResult]::new('version', 'version', [CompletionResultType]::ParameterValue, 'Display version information')
            [CompletionResult]::new('workspace', 'workspace', [CompletionResultType]::ParameterValue, 'Commands for working with workspaces')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'jj;abandon' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('-s', '-s', [CompletionResultType]::ParameterName, 'Do not print every abandoned commit on a separate line')
            [CompletionResult]::new('--summary', '--summary', [CompletionResultType]::ParameterName, 'Do not print every abandoned commit on a separate line')
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Ignored (but lets you pass `-r` for consistency with other commands)')
            [CompletionResult]::new('--restore-descendants', '--restore-descendants', [CompletionResultType]::ParameterName, 'Do not modify the content of the children of the abandoned commits')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;backout' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'The revision(s) to apply the reverse of')
            [CompletionResult]::new('--revisions', '--revisions', [CompletionResultType]::ParameterName, 'The revision(s) to apply the reverse of')
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'The revision to apply the reverse changes on top of')
            [CompletionResult]::new('--destination', '--destination', [CompletionResultType]::ParameterName, 'The revision to apply the reverse changes on top of')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;bookmark' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('create', 'create', [CompletionResultType]::ParameterValue, 'Create a new bookmark')
            [CompletionResult]::new('c', 'c', [CompletionResultType]::ParameterValue, 'Create a new bookmark')
            [CompletionResult]::new('delete', 'delete', [CompletionResultType]::ParameterValue, 'Delete an existing bookmark and propagate the deletion to remotes on the next push')
            [CompletionResult]::new('d', 'd', [CompletionResultType]::ParameterValue, 'Delete an existing bookmark and propagate the deletion to remotes on the next push')
            [CompletionResult]::new('forget', 'forget', [CompletionResultType]::ParameterValue, 'Forget everything about a bookmark, including its local and remote targets')
            [CompletionResult]::new('f', 'f', [CompletionResultType]::ParameterValue, 'Forget everything about a bookmark, including its local and remote targets')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List bookmarks and their targets')
            [CompletionResult]::new('l', 'l', [CompletionResultType]::ParameterValue, 'List bookmarks and their targets')
            [CompletionResult]::new('move', 'move', [CompletionResultType]::ParameterValue, 'Move existing bookmarks to target revision')
            [CompletionResult]::new('m', 'm', [CompletionResultType]::ParameterValue, 'Move existing bookmarks to target revision')
            [CompletionResult]::new('rename', 'rename', [CompletionResultType]::ParameterValue, 'Rename `old` bookmark name to `new` bookmark name')
            [CompletionResult]::new('r', 'r', [CompletionResultType]::ParameterValue, 'Rename `old` bookmark name to `new` bookmark name')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Create or update a bookmark to point to a certain commit')
            [CompletionResult]::new('s', 's', [CompletionResultType]::ParameterValue, 'Create or update a bookmark to point to a certain commit')
            [CompletionResult]::new('track', 'track', [CompletionResultType]::ParameterValue, 'Start tracking given remote bookmarks')
            [CompletionResult]::new('t', 't', [CompletionResultType]::ParameterValue, 'Start tracking given remote bookmarks')
            [CompletionResult]::new('untrack', 'untrack', [CompletionResultType]::ParameterValue, 'Stop tracking given remote bookmarks')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'jj;bookmark;create' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'The bookmark''s target revision')
            [CompletionResult]::new('--revision', '--revision', [CompletionResultType]::ParameterName, 'The bookmark''s target revision')
            [CompletionResult]::new('--to', '--to', [CompletionResultType]::ParameterName, 'The bookmark''s target revision')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;bookmark;c' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'The bookmark''s target revision')
            [CompletionResult]::new('--revision', '--revision', [CompletionResultType]::ParameterName, 'The bookmark''s target revision')
            [CompletionResult]::new('--to', '--to', [CompletionResultType]::ParameterName, 'The bookmark''s target revision')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;bookmark;delete' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;bookmark;d' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;bookmark;forget' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;bookmark;f' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;bookmark;list' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Show bookmarks whose local targets are in the given revisions')
            [CompletionResult]::new('--revisions', '--revisions', [CompletionResultType]::ParameterName, 'Show bookmarks whose local targets are in the given revisions')
            [CompletionResult]::new('-T', '-T ', [CompletionResultType]::ParameterName, 'Render each bookmark using the given template')
            [CompletionResult]::new('--template', '--template', [CompletionResultType]::ParameterName, 'Render each bookmark using the given template')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('-a', '-a', [CompletionResultType]::ParameterName, 'Show all tracking and non-tracking remote bookmarks including the ones whose targets are synchronized with the local bookmarks')
            [CompletionResult]::new('--all-remotes', '--all-remotes', [CompletionResultType]::ParameterName, 'Show all tracking and non-tracking remote bookmarks including the ones whose targets are synchronized with the local bookmarks')
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Show remote tracked bookmarks only. Omits local Git-tracking bookmarks by default')
            [CompletionResult]::new('--tracked', '--tracked', [CompletionResultType]::ParameterName, 'Show remote tracked bookmarks only. Omits local Git-tracking bookmarks by default')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'Show conflicted bookmarks only')
            [CompletionResult]::new('--conflicted', '--conflicted', [CompletionResultType]::ParameterName, 'Show conflicted bookmarks only')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;bookmark;l' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Show bookmarks whose local targets are in the given revisions')
            [CompletionResult]::new('--revisions', '--revisions', [CompletionResultType]::ParameterName, 'Show bookmarks whose local targets are in the given revisions')
            [CompletionResult]::new('-T', '-T ', [CompletionResultType]::ParameterName, 'Render each bookmark using the given template')
            [CompletionResult]::new('--template', '--template', [CompletionResultType]::ParameterName, 'Render each bookmark using the given template')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('-a', '-a', [CompletionResultType]::ParameterName, 'Show all tracking and non-tracking remote bookmarks including the ones whose targets are synchronized with the local bookmarks')
            [CompletionResult]::new('--all-remotes', '--all-remotes', [CompletionResultType]::ParameterName, 'Show all tracking and non-tracking remote bookmarks including the ones whose targets are synchronized with the local bookmarks')
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Show remote tracked bookmarks only. Omits local Git-tracking bookmarks by default')
            [CompletionResult]::new('--tracked', '--tracked', [CompletionResultType]::ParameterName, 'Show remote tracked bookmarks only. Omits local Git-tracking bookmarks by default')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'Show conflicted bookmarks only')
            [CompletionResult]::new('--conflicted', '--conflicted', [CompletionResultType]::ParameterName, 'Show conflicted bookmarks only')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;bookmark;move' {
            [CompletionResult]::new('--from', '--from', [CompletionResultType]::ParameterName, 'Move bookmarks from the given revisions')
            [CompletionResult]::new('--to', '--to', [CompletionResultType]::ParameterName, 'Move bookmarks to this revision')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('-B', '-B ', [CompletionResultType]::ParameterName, 'Allow moving bookmarks backwards or sideways')
            [CompletionResult]::new('--allow-backwards', '--allow-backwards', [CompletionResultType]::ParameterName, 'Allow moving bookmarks backwards or sideways')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;bookmark;m' {
            [CompletionResult]::new('--from', '--from', [CompletionResultType]::ParameterName, 'Move bookmarks from the given revisions')
            [CompletionResult]::new('--to', '--to', [CompletionResultType]::ParameterName, 'Move bookmarks to this revision')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('-B', '-B ', [CompletionResultType]::ParameterName, 'Allow moving bookmarks backwards or sideways')
            [CompletionResult]::new('--allow-backwards', '--allow-backwards', [CompletionResultType]::ParameterName, 'Allow moving bookmarks backwards or sideways')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;bookmark;rename' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;bookmark;r' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;bookmark;set' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'The bookmark''s target revision')
            [CompletionResult]::new('--revision', '--revision', [CompletionResultType]::ParameterName, 'The bookmark''s target revision')
            [CompletionResult]::new('--to', '--to', [CompletionResultType]::ParameterName, 'The bookmark''s target revision')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('-B', '-B ', [CompletionResultType]::ParameterName, 'Allow moving the bookmark backwards or sideways')
            [CompletionResult]::new('--allow-backwards', '--allow-backwards', [CompletionResultType]::ParameterName, 'Allow moving the bookmark backwards or sideways')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;bookmark;s' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'The bookmark''s target revision')
            [CompletionResult]::new('--revision', '--revision', [CompletionResultType]::ParameterName, 'The bookmark''s target revision')
            [CompletionResult]::new('--to', '--to', [CompletionResultType]::ParameterName, 'The bookmark''s target revision')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('-B', '-B ', [CompletionResultType]::ParameterName, 'Allow moving the bookmark backwards or sideways')
            [CompletionResult]::new('--allow-backwards', '--allow-backwards', [CompletionResultType]::ParameterName, 'Allow moving the bookmark backwards or sideways')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;bookmark;track' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;bookmark;t' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;bookmark;untrack' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;bookmark;help' {
            [CompletionResult]::new('create', 'create', [CompletionResultType]::ParameterValue, 'Create a new bookmark')
            [CompletionResult]::new('delete', 'delete', [CompletionResultType]::ParameterValue, 'Delete an existing bookmark and propagate the deletion to remotes on the next push')
            [CompletionResult]::new('forget', 'forget', [CompletionResultType]::ParameterValue, 'Forget everything about a bookmark, including its local and remote targets')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List bookmarks and their targets')
            [CompletionResult]::new('move', 'move', [CompletionResultType]::ParameterValue, 'Move existing bookmarks to target revision')
            [CompletionResult]::new('rename', 'rename', [CompletionResultType]::ParameterValue, 'Rename `old` bookmark name to `new` bookmark name')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Create or update a bookmark to point to a certain commit')
            [CompletionResult]::new('track', 'track', [CompletionResultType]::ParameterValue, 'Start tracking given remote bookmarks')
            [CompletionResult]::new('untrack', 'untrack', [CompletionResultType]::ParameterValue, 'Stop tracking given remote bookmarks')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'jj;bookmark;help;create' {
            break
        }
        'jj;bookmark;help;delete' {
            break
        }
        'jj;bookmark;help;forget' {
            break
        }
        'jj;bookmark;help;list' {
            break
        }
        'jj;bookmark;help;move' {
            break
        }
        'jj;bookmark;help;rename' {
            break
        }
        'jj;bookmark;help;set' {
            break
        }
        'jj;bookmark;help;track' {
            break
        }
        'jj;bookmark;help;untrack' {
            break
        }
        'jj;bookmark;help;help' {
            break
        }
        'jj;branch' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('create', 'create', [CompletionResultType]::ParameterValue, 'Create a new bookmark')
            [CompletionResult]::new('c', 'c', [CompletionResultType]::ParameterValue, 'Create a new bookmark')
            [CompletionResult]::new('delete', 'delete', [CompletionResultType]::ParameterValue, 'Delete an existing bookmark and propagate the deletion to remotes on the next push')
            [CompletionResult]::new('d', 'd', [CompletionResultType]::ParameterValue, 'Delete an existing bookmark and propagate the deletion to remotes on the next push')
            [CompletionResult]::new('forget', 'forget', [CompletionResultType]::ParameterValue, 'Forget everything about a bookmark, including its local and remote targets')
            [CompletionResult]::new('f', 'f', [CompletionResultType]::ParameterValue, 'Forget everything about a bookmark, including its local and remote targets')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List bookmarks and their targets')
            [CompletionResult]::new('l', 'l', [CompletionResultType]::ParameterValue, 'List bookmarks and their targets')
            [CompletionResult]::new('move', 'move', [CompletionResultType]::ParameterValue, 'Move existing bookmarks to target revision')
            [CompletionResult]::new('m', 'm', [CompletionResultType]::ParameterValue, 'Move existing bookmarks to target revision')
            [CompletionResult]::new('rename', 'rename', [CompletionResultType]::ParameterValue, 'Rename `old` bookmark name to `new` bookmark name')
            [CompletionResult]::new('r', 'r', [CompletionResultType]::ParameterValue, 'Rename `old` bookmark name to `new` bookmark name')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Create or update a bookmark to point to a certain commit')
            [CompletionResult]::new('s', 's', [CompletionResultType]::ParameterValue, 'Create or update a bookmark to point to a certain commit')
            [CompletionResult]::new('track', 'track', [CompletionResultType]::ParameterValue, 'Start tracking given remote bookmarks')
            [CompletionResult]::new('t', 't', [CompletionResultType]::ParameterValue, 'Start tracking given remote bookmarks')
            [CompletionResult]::new('untrack', 'untrack', [CompletionResultType]::ParameterValue, 'Stop tracking given remote bookmarks')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'jj;branch;create' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'The bookmark''s target revision')
            [CompletionResult]::new('--revision', '--revision', [CompletionResultType]::ParameterName, 'The bookmark''s target revision')
            [CompletionResult]::new('--to', '--to', [CompletionResultType]::ParameterName, 'The bookmark''s target revision')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;branch;c' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'The bookmark''s target revision')
            [CompletionResult]::new('--revision', '--revision', [CompletionResultType]::ParameterName, 'The bookmark''s target revision')
            [CompletionResult]::new('--to', '--to', [CompletionResultType]::ParameterName, 'The bookmark''s target revision')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;branch;delete' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;branch;d' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;branch;forget' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;branch;f' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;branch;list' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Show bookmarks whose local targets are in the given revisions')
            [CompletionResult]::new('--revisions', '--revisions', [CompletionResultType]::ParameterName, 'Show bookmarks whose local targets are in the given revisions')
            [CompletionResult]::new('-T', '-T ', [CompletionResultType]::ParameterName, 'Render each bookmark using the given template')
            [CompletionResult]::new('--template', '--template', [CompletionResultType]::ParameterName, 'Render each bookmark using the given template')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('-a', '-a', [CompletionResultType]::ParameterName, 'Show all tracking and non-tracking remote bookmarks including the ones whose targets are synchronized with the local bookmarks')
            [CompletionResult]::new('--all-remotes', '--all-remotes', [CompletionResultType]::ParameterName, 'Show all tracking and non-tracking remote bookmarks including the ones whose targets are synchronized with the local bookmarks')
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Show remote tracked bookmarks only. Omits local Git-tracking bookmarks by default')
            [CompletionResult]::new('--tracked', '--tracked', [CompletionResultType]::ParameterName, 'Show remote tracked bookmarks only. Omits local Git-tracking bookmarks by default')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'Show conflicted bookmarks only')
            [CompletionResult]::new('--conflicted', '--conflicted', [CompletionResultType]::ParameterName, 'Show conflicted bookmarks only')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;branch;l' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Show bookmarks whose local targets are in the given revisions')
            [CompletionResult]::new('--revisions', '--revisions', [CompletionResultType]::ParameterName, 'Show bookmarks whose local targets are in the given revisions')
            [CompletionResult]::new('-T', '-T ', [CompletionResultType]::ParameterName, 'Render each bookmark using the given template')
            [CompletionResult]::new('--template', '--template', [CompletionResultType]::ParameterName, 'Render each bookmark using the given template')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('-a', '-a', [CompletionResultType]::ParameterName, 'Show all tracking and non-tracking remote bookmarks including the ones whose targets are synchronized with the local bookmarks')
            [CompletionResult]::new('--all-remotes', '--all-remotes', [CompletionResultType]::ParameterName, 'Show all tracking and non-tracking remote bookmarks including the ones whose targets are synchronized with the local bookmarks')
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Show remote tracked bookmarks only. Omits local Git-tracking bookmarks by default')
            [CompletionResult]::new('--tracked', '--tracked', [CompletionResultType]::ParameterName, 'Show remote tracked bookmarks only. Omits local Git-tracking bookmarks by default')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'Show conflicted bookmarks only')
            [CompletionResult]::new('--conflicted', '--conflicted', [CompletionResultType]::ParameterName, 'Show conflicted bookmarks only')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;branch;move' {
            [CompletionResult]::new('--from', '--from', [CompletionResultType]::ParameterName, 'Move bookmarks from the given revisions')
            [CompletionResult]::new('--to', '--to', [CompletionResultType]::ParameterName, 'Move bookmarks to this revision')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('-B', '-B ', [CompletionResultType]::ParameterName, 'Allow moving bookmarks backwards or sideways')
            [CompletionResult]::new('--allow-backwards', '--allow-backwards', [CompletionResultType]::ParameterName, 'Allow moving bookmarks backwards or sideways')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;branch;m' {
            [CompletionResult]::new('--from', '--from', [CompletionResultType]::ParameterName, 'Move bookmarks from the given revisions')
            [CompletionResult]::new('--to', '--to', [CompletionResultType]::ParameterName, 'Move bookmarks to this revision')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('-B', '-B ', [CompletionResultType]::ParameterName, 'Allow moving bookmarks backwards or sideways')
            [CompletionResult]::new('--allow-backwards', '--allow-backwards', [CompletionResultType]::ParameterName, 'Allow moving bookmarks backwards or sideways')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;branch;rename' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;branch;r' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;branch;set' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'The bookmark''s target revision')
            [CompletionResult]::new('--revision', '--revision', [CompletionResultType]::ParameterName, 'The bookmark''s target revision')
            [CompletionResult]::new('--to', '--to', [CompletionResultType]::ParameterName, 'The bookmark''s target revision')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('-B', '-B ', [CompletionResultType]::ParameterName, 'Allow moving the bookmark backwards or sideways')
            [CompletionResult]::new('--allow-backwards', '--allow-backwards', [CompletionResultType]::ParameterName, 'Allow moving the bookmark backwards or sideways')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;branch;s' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'The bookmark''s target revision')
            [CompletionResult]::new('--revision', '--revision', [CompletionResultType]::ParameterName, 'The bookmark''s target revision')
            [CompletionResult]::new('--to', '--to', [CompletionResultType]::ParameterName, 'The bookmark''s target revision')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('-B', '-B ', [CompletionResultType]::ParameterName, 'Allow moving the bookmark backwards or sideways')
            [CompletionResult]::new('--allow-backwards', '--allow-backwards', [CompletionResultType]::ParameterName, 'Allow moving the bookmark backwards or sideways')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;branch;track' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;branch;t' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;branch;untrack' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;branch;help' {
            [CompletionResult]::new('create', 'create', [CompletionResultType]::ParameterValue, 'Create a new bookmark')
            [CompletionResult]::new('delete', 'delete', [CompletionResultType]::ParameterValue, 'Delete an existing bookmark and propagate the deletion to remotes on the next push')
            [CompletionResult]::new('forget', 'forget', [CompletionResultType]::ParameterValue, 'Forget everything about a bookmark, including its local and remote targets')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List bookmarks and their targets')
            [CompletionResult]::new('move', 'move', [CompletionResultType]::ParameterValue, 'Move existing bookmarks to target revision')
            [CompletionResult]::new('rename', 'rename', [CompletionResultType]::ParameterValue, 'Rename `old` bookmark name to `new` bookmark name')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Create or update a bookmark to point to a certain commit')
            [CompletionResult]::new('track', 'track', [CompletionResultType]::ParameterValue, 'Start tracking given remote bookmarks')
            [CompletionResult]::new('untrack', 'untrack', [CompletionResultType]::ParameterValue, 'Stop tracking given remote bookmarks')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'jj;branch;help;create' {
            break
        }
        'jj;branch;help;delete' {
            break
        }
        'jj;branch;help;forget' {
            break
        }
        'jj;branch;help;list' {
            break
        }
        'jj;branch;help;move' {
            break
        }
        'jj;branch;help;rename' {
            break
        }
        'jj;branch;help;set' {
            break
        }
        'jj;branch;help;track' {
            break
        }
        'jj;branch;help;untrack' {
            break
        }
        'jj;branch;help;help' {
            break
        }
        'jj;cat' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'The revision to get the file contents from')
            [CompletionResult]::new('--revision', '--revision', [CompletionResultType]::ParameterName, 'The revision to get the file contents from')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;checkout' {
            [CompletionResult]::new('-m', '-m', [CompletionResultType]::ParameterName, 'The change description to use')
            [CompletionResult]::new('--message', '--message', [CompletionResultType]::ParameterName, 'The change description to use')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Ignored (but lets you pass `-r` for consistency with other commands)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;chmod' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'The revision to update')
            [CompletionResult]::new('--revision', '--revision', [CompletionResultType]::ParameterName, 'The revision to update')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;commit' {
            [CompletionResult]::new('--tool', '--tool', [CompletionResultType]::ParameterName, 'Specify diff editor to be used (implies --interactive)')
            [CompletionResult]::new('-m', '-m', [CompletionResultType]::ParameterName, 'The change description to use (don''t open editor)')
            [CompletionResult]::new('--message', '--message', [CompletionResultType]::ParameterName, 'The change description to use (don''t open editor)')
            [CompletionResult]::new('--author', '--author', [CompletionResultType]::ParameterName, 'Set author to the provided string')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('-i', '-i', [CompletionResultType]::ParameterName, 'Interactively choose which changes to include in the first commit')
            [CompletionResult]::new('--interactive', '--interactive', [CompletionResultType]::ParameterName, 'Interactively choose which changes to include in the first commit')
            [CompletionResult]::new('--reset-author', '--reset-author', [CompletionResultType]::ParameterName, 'Reset the author to the configured user')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;ci' {
            [CompletionResult]::new('--tool', '--tool', [CompletionResultType]::ParameterName, 'Specify diff editor to be used (implies --interactive)')
            [CompletionResult]::new('-m', '-m', [CompletionResultType]::ParameterName, 'The change description to use (don''t open editor)')
            [CompletionResult]::new('--message', '--message', [CompletionResultType]::ParameterName, 'The change description to use (don''t open editor)')
            [CompletionResult]::new('--author', '--author', [CompletionResultType]::ParameterName, 'Set author to the provided string')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('-i', '-i', [CompletionResultType]::ParameterName, 'Interactively choose which changes to include in the first commit')
            [CompletionResult]::new('--interactive', '--interactive', [CompletionResultType]::ParameterName, 'Interactively choose which changes to include in the first commit')
            [CompletionResult]::new('--reset-author', '--reset-author', [CompletionResultType]::ParameterName, 'Reset the author to the configured user')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;config' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('edit', 'edit', [CompletionResultType]::ParameterValue, 'Start an editor on a jj config file')
            [CompletionResult]::new('e', 'e', [CompletionResultType]::ParameterValue, 'Start an editor on a jj config file')
            [CompletionResult]::new('get', 'get', [CompletionResultType]::ParameterValue, 'Get the value of a given config option.')
            [CompletionResult]::new('g', 'g', [CompletionResultType]::ParameterValue, 'Get the value of a given config option.')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List variables set in config file, along with their values')
            [CompletionResult]::new('l', 'l', [CompletionResultType]::ParameterValue, 'List variables set in config file, along with their values')
            [CompletionResult]::new('path', 'path', [CompletionResultType]::ParameterValue, 'Print the path to the config file')
            [CompletionResult]::new('p', 'p', [CompletionResultType]::ParameterValue, 'Print the path to the config file')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Update config file to set the given option to a given value')
            [CompletionResult]::new('s', 's', [CompletionResultType]::ParameterValue, 'Update config file to set the given option to a given value')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'jj;config;edit' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--user', '--user', [CompletionResultType]::ParameterName, 'Target the user-level config')
            [CompletionResult]::new('--repo', '--repo', [CompletionResultType]::ParameterName, 'Target the repo-level config')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;config;e' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--user', '--user', [CompletionResultType]::ParameterName, 'Target the user-level config')
            [CompletionResult]::new('--repo', '--repo', [CompletionResultType]::ParameterName, 'Target the repo-level config')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;config;get' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;config;g' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;config;list' {
            [CompletionResult]::new('-T', '-T ', [CompletionResultType]::ParameterName, 'Render each variable using the given template')
            [CompletionResult]::new('--template', '--template', [CompletionResultType]::ParameterName, 'Render each variable using the given template')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--include-defaults', '--include-defaults', [CompletionResultType]::ParameterName, 'Whether to explicitly include built-in default values in the list')
            [CompletionResult]::new('--include-overridden', '--include-overridden', [CompletionResultType]::ParameterName, 'Allow printing overridden values')
            [CompletionResult]::new('--user', '--user', [CompletionResultType]::ParameterName, 'Target the user-level config')
            [CompletionResult]::new('--repo', '--repo', [CompletionResultType]::ParameterName, 'Target the repo-level config')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;config;l' {
            [CompletionResult]::new('-T', '-T ', [CompletionResultType]::ParameterName, 'Render each variable using the given template')
            [CompletionResult]::new('--template', '--template', [CompletionResultType]::ParameterName, 'Render each variable using the given template')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--include-defaults', '--include-defaults', [CompletionResultType]::ParameterName, 'Whether to explicitly include built-in default values in the list')
            [CompletionResult]::new('--include-overridden', '--include-overridden', [CompletionResultType]::ParameterName, 'Allow printing overridden values')
            [CompletionResult]::new('--user', '--user', [CompletionResultType]::ParameterName, 'Target the user-level config')
            [CompletionResult]::new('--repo', '--repo', [CompletionResultType]::ParameterName, 'Target the repo-level config')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;config;path' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--user', '--user', [CompletionResultType]::ParameterName, 'Target the user-level config')
            [CompletionResult]::new('--repo', '--repo', [CompletionResultType]::ParameterName, 'Target the repo-level config')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;config;p' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--user', '--user', [CompletionResultType]::ParameterName, 'Target the user-level config')
            [CompletionResult]::new('--repo', '--repo', [CompletionResultType]::ParameterName, 'Target the repo-level config')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;config;set' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--user', '--user', [CompletionResultType]::ParameterName, 'Target the user-level config')
            [CompletionResult]::new('--repo', '--repo', [CompletionResultType]::ParameterName, 'Target the repo-level config')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;config;s' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--user', '--user', [CompletionResultType]::ParameterName, 'Target the user-level config')
            [CompletionResult]::new('--repo', '--repo', [CompletionResultType]::ParameterName, 'Target the repo-level config')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;config;help' {
            [CompletionResult]::new('edit', 'edit', [CompletionResultType]::ParameterValue, 'Start an editor on a jj config file')
            [CompletionResult]::new('get', 'get', [CompletionResultType]::ParameterValue, 'Get the value of a given config option.')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List variables set in config file, along with their values')
            [CompletionResult]::new('path', 'path', [CompletionResultType]::ParameterValue, 'Print the path to the config file')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Update config file to set the given option to a given value')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'jj;config;help;edit' {
            break
        }
        'jj;config;help;get' {
            break
        }
        'jj;config;help;list' {
            break
        }
        'jj;config;help;path' {
            break
        }
        'jj;config;help;set' {
            break
        }
        'jj;config;help;help' {
            break
        }
        'jj;debug' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('copy-detection', 'copy-detection', [CompletionResultType]::ParameterValue, 'Rebuild commit index')
            [CompletionResult]::new('fileset', 'fileset', [CompletionResultType]::ParameterValue, 'Parse fileset expression')
            [CompletionResult]::new('index', 'index', [CompletionResultType]::ParameterValue, 'Show commit index stats')
            [CompletionResult]::new('local-working-copy', 'local-working-copy', [CompletionResultType]::ParameterValue, 'Show information about the local working copy state')
            [CompletionResult]::new('operation', 'operation', [CompletionResultType]::ParameterValue, 'Show information about an operation and its view')
            [CompletionResult]::new('view', 'view', [CompletionResultType]::ParameterValue, 'Show information about an operation and its view')
            [CompletionResult]::new('reindex', 'reindex', [CompletionResultType]::ParameterValue, 'Rebuild commit index')
            [CompletionResult]::new('revset', 'revset', [CompletionResultType]::ParameterValue, 'Evaluate revset to full commit IDs')
            [CompletionResult]::new('snapshot', 'snapshot', [CompletionResultType]::ParameterValue, 'Trigger a snapshot in the op log')
            [CompletionResult]::new('template', 'template', [CompletionResultType]::ParameterValue, 'Parse a template')
            [CompletionResult]::new('tree', 'tree', [CompletionResultType]::ParameterValue, 'List the recursive entries of a tree')
            [CompletionResult]::new('watchman', 'watchman', [CompletionResultType]::ParameterValue, 'watchman')
            [CompletionResult]::new('working-copy', 'working-copy', [CompletionResultType]::ParameterValue, 'Show information about the working copy state')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'jj;debug;copy-detection' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;debug;fileset' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;debug;index' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;debug;local-working-copy' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;debug;operation' {
            [CompletionResult]::new('--display', '--display', [CompletionResultType]::ParameterName, 'display')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;debug;view' {
            [CompletionResult]::new('--display', '--display', [CompletionResultType]::ParameterName, 'display')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;debug;reindex' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;debug;revset' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;debug;snapshot' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;debug;template' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;debug;tree' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'r')
            [CompletionResult]::new('--revision', '--revision', [CompletionResultType]::ParameterName, 'revision')
            [CompletionResult]::new('--id', '--id', [CompletionResultType]::ParameterName, 'id')
            [CompletionResult]::new('--dir', '--dir', [CompletionResultType]::ParameterName, 'dir')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;debug;watchman' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('status', 'status', [CompletionResultType]::ParameterValue, 'Check whether `watchman` is enabled and whether it''s correctly installed')
            [CompletionResult]::new('query-clock', 'query-clock', [CompletionResultType]::ParameterValue, 'query-clock')
            [CompletionResult]::new('query-changed-files', 'query-changed-files', [CompletionResultType]::ParameterValue, 'query-changed-files')
            [CompletionResult]::new('reset-clock', 'reset-clock', [CompletionResultType]::ParameterValue, 'reset-clock')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'jj;debug;watchman;status' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;debug;watchman;query-clock' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;debug;watchman;query-changed-files' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;debug;watchman;reset-clock' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;debug;watchman;help' {
            [CompletionResult]::new('status', 'status', [CompletionResultType]::ParameterValue, 'Check whether `watchman` is enabled and whether it''s correctly installed')
            [CompletionResult]::new('query-clock', 'query-clock', [CompletionResultType]::ParameterValue, 'query-clock')
            [CompletionResult]::new('query-changed-files', 'query-changed-files', [CompletionResultType]::ParameterValue, 'query-changed-files')
            [CompletionResult]::new('reset-clock', 'reset-clock', [CompletionResultType]::ParameterValue, 'reset-clock')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'jj;debug;watchman;help;status' {
            break
        }
        'jj;debug;watchman;help;query-clock' {
            break
        }
        'jj;debug;watchman;help;query-changed-files' {
            break
        }
        'jj;debug;watchman;help;reset-clock' {
            break
        }
        'jj;debug;watchman;help;help' {
            break
        }
        'jj;debug;working-copy' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;debug;help' {
            [CompletionResult]::new('copy-detection', 'copy-detection', [CompletionResultType]::ParameterValue, 'Rebuild commit index')
            [CompletionResult]::new('fileset', 'fileset', [CompletionResultType]::ParameterValue, 'Parse fileset expression')
            [CompletionResult]::new('index', 'index', [CompletionResultType]::ParameterValue, 'Show commit index stats')
            [CompletionResult]::new('local-working-copy', 'local-working-copy', [CompletionResultType]::ParameterValue, 'Show information about the local working copy state')
            [CompletionResult]::new('operation', 'operation', [CompletionResultType]::ParameterValue, 'Show information about an operation and its view')
            [CompletionResult]::new('reindex', 'reindex', [CompletionResultType]::ParameterValue, 'Rebuild commit index')
            [CompletionResult]::new('revset', 'revset', [CompletionResultType]::ParameterValue, 'Evaluate revset to full commit IDs')
            [CompletionResult]::new('snapshot', 'snapshot', [CompletionResultType]::ParameterValue, 'Trigger a snapshot in the op log')
            [CompletionResult]::new('template', 'template', [CompletionResultType]::ParameterValue, 'Parse a template')
            [CompletionResult]::new('tree', 'tree', [CompletionResultType]::ParameterValue, 'List the recursive entries of a tree')
            [CompletionResult]::new('watchman', 'watchman', [CompletionResultType]::ParameterValue, 'watchman')
            [CompletionResult]::new('working-copy', 'working-copy', [CompletionResultType]::ParameterValue, 'Show information about the working copy state')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'jj;debug;help;copy-detection' {
            break
        }
        'jj;debug;help;fileset' {
            break
        }
        'jj;debug;help;index' {
            break
        }
        'jj;debug;help;local-working-copy' {
            break
        }
        'jj;debug;help;operation' {
            break
        }
        'jj;debug;help;reindex' {
            break
        }
        'jj;debug;help;revset' {
            break
        }
        'jj;debug;help;snapshot' {
            break
        }
        'jj;debug;help;template' {
            break
        }
        'jj;debug;help;tree' {
            break
        }
        'jj;debug;help;watchman' {
            [CompletionResult]::new('status', 'status', [CompletionResultType]::ParameterValue, 'Check whether `watchman` is enabled and whether it''s correctly installed')
            [CompletionResult]::new('query-clock', 'query-clock', [CompletionResultType]::ParameterValue, 'query-clock')
            [CompletionResult]::new('query-changed-files', 'query-changed-files', [CompletionResultType]::ParameterValue, 'query-changed-files')
            [CompletionResult]::new('reset-clock', 'reset-clock', [CompletionResultType]::ParameterValue, 'reset-clock')
            break
        }
        'jj;debug;help;watchman;status' {
            break
        }
        'jj;debug;help;watchman;query-clock' {
            break
        }
        'jj;debug;help;watchman;query-changed-files' {
            break
        }
        'jj;debug;help;watchman;reset-clock' {
            break
        }
        'jj;debug;help;working-copy' {
            break
        }
        'jj;debug;help;help' {
            break
        }
        'jj;describe' {
            [CompletionResult]::new('-m', '-m', [CompletionResultType]::ParameterName, 'The change description to use (don''t open editor)')
            [CompletionResult]::new('--message', '--message', [CompletionResultType]::ParameterName, 'The change description to use (don''t open editor)')
            [CompletionResult]::new('--author', '--author', [CompletionResultType]::ParameterName, 'Set author to the provided string')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Ignored (but lets you pass `-r` for consistency with other commands)')
            [CompletionResult]::new('--stdin', '--stdin', [CompletionResultType]::ParameterName, 'Read the change description from stdin')
            [CompletionResult]::new('--no-edit', '--no-edit', [CompletionResultType]::ParameterName, 'Don''t open an editor')
            [CompletionResult]::new('--reset-author', '--reset-author', [CompletionResultType]::ParameterName, 'Reset the author to the configured user')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;desc' {
            [CompletionResult]::new('-m', '-m', [CompletionResultType]::ParameterName, 'The change description to use (don''t open editor)')
            [CompletionResult]::new('--message', '--message', [CompletionResultType]::ParameterName, 'The change description to use (don''t open editor)')
            [CompletionResult]::new('--author', '--author', [CompletionResultType]::ParameterName, 'Set author to the provided string')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Ignored (but lets you pass `-r` for consistency with other commands)')
            [CompletionResult]::new('--stdin', '--stdin', [CompletionResultType]::ParameterName, 'Read the change description from stdin')
            [CompletionResult]::new('--no-edit', '--no-edit', [CompletionResultType]::ParameterName, 'Don''t open an editor')
            [CompletionResult]::new('--reset-author', '--reset-author', [CompletionResultType]::ParameterName, 'Reset the author to the configured user')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;diff' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Show changes in this revision, compared to its parent(s)')
            [CompletionResult]::new('--revision', '--revision', [CompletionResultType]::ParameterName, 'Show changes in this revision, compared to its parent(s)')
            [CompletionResult]::new('--from', '--from', [CompletionResultType]::ParameterName, 'Show changes from this revision')
            [CompletionResult]::new('--to', '--to', [CompletionResultType]::ParameterName, 'Show changes to this revision')
            [CompletionResult]::new('--tool', '--tool', [CompletionResultType]::ParameterName, 'Generate diff by external command')
            [CompletionResult]::new('--context', '--context', [CompletionResultType]::ParameterName, 'Number of lines of context to show')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('-s', '-s', [CompletionResultType]::ParameterName, 'For each path, show only whether it was modified, added, or deleted')
            [CompletionResult]::new('--summary', '--summary', [CompletionResultType]::ParameterName, 'For each path, show only whether it was modified, added, or deleted')
            [CompletionResult]::new('--stat', '--stat', [CompletionResultType]::ParameterName, 'Show a histogram of the changes')
            [CompletionResult]::new('--types', '--types', [CompletionResultType]::ParameterName, 'For each path, show only its type before and after')
            [CompletionResult]::new('--name-only', '--name-only', [CompletionResultType]::ParameterName, 'For each path, show only its path')
            [CompletionResult]::new('--git', '--git', [CompletionResultType]::ParameterName, 'Show a Git-format diff')
            [CompletionResult]::new('--color-words', '--color-words', [CompletionResultType]::ParameterName, 'Show a word-level diff with changes indicated only by color')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;diffedit' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'The revision to touch up')
            [CompletionResult]::new('--revision', '--revision', [CompletionResultType]::ParameterName, 'The revision to touch up')
            [CompletionResult]::new('--from', '--from', [CompletionResultType]::ParameterName, 'Show changes from this revision')
            [CompletionResult]::new('--to', '--to', [CompletionResultType]::ParameterName, 'Edit changes in this revision')
            [CompletionResult]::new('--tool', '--tool', [CompletionResultType]::ParameterName, 'Specify diff editor to be used')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--restore-descendants', '--restore-descendants', [CompletionResultType]::ParameterName, 'Preserve the content (not the diff) when rebasing descendants')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;duplicate' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Ignored (but lets you pass `-r` for consistency with other commands)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;edit' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Ignored (but lets you pass `-r` for consistency with other commands)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;evolog' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'r')
            [CompletionResult]::new('--revision', '--revision', [CompletionResultType]::ParameterName, 'revision')
            [CompletionResult]::new('-n', '-n', [CompletionResultType]::ParameterName, 'Limit number of revisions to show')
            [CompletionResult]::new('--limit', '--limit', [CompletionResultType]::ParameterName, 'Limit number of revisions to show')
            [CompletionResult]::new('-l', '-l', [CompletionResultType]::ParameterName, 'l')
            [CompletionResult]::new('-T', '-T ', [CompletionResultType]::ParameterName, 'Render each revision using the given template')
            [CompletionResult]::new('--template', '--template', [CompletionResultType]::ParameterName, 'Render each revision using the given template')
            [CompletionResult]::new('--tool', '--tool', [CompletionResultType]::ParameterName, 'Generate diff by external command')
            [CompletionResult]::new('--context', '--context', [CompletionResultType]::ParameterName, 'Number of lines of context to show')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--no-graph', '--no-graph', [CompletionResultType]::ParameterName, 'Don''t show the graph, show a flat list of revisions')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'Show patch compared to the previous version of this change')
            [CompletionResult]::new('--patch', '--patch', [CompletionResultType]::ParameterName, 'Show patch compared to the previous version of this change')
            [CompletionResult]::new('-s', '-s', [CompletionResultType]::ParameterName, 'For each path, show only whether it was modified, added, or deleted')
            [CompletionResult]::new('--summary', '--summary', [CompletionResultType]::ParameterName, 'For each path, show only whether it was modified, added, or deleted')
            [CompletionResult]::new('--stat', '--stat', [CompletionResultType]::ParameterName, 'Show a histogram of the changes')
            [CompletionResult]::new('--types', '--types', [CompletionResultType]::ParameterName, 'For each path, show only its type before and after')
            [CompletionResult]::new('--name-only', '--name-only', [CompletionResultType]::ParameterName, 'For each path, show only its path')
            [CompletionResult]::new('--git', '--git', [CompletionResultType]::ParameterName, 'Show a Git-format diff')
            [CompletionResult]::new('--color-words', '--color-words', [CompletionResultType]::ParameterName, 'Show a word-level diff with changes indicated only by color')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;evolution-log' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'r')
            [CompletionResult]::new('--revision', '--revision', [CompletionResultType]::ParameterName, 'revision')
            [CompletionResult]::new('-n', '-n', [CompletionResultType]::ParameterName, 'Limit number of revisions to show')
            [CompletionResult]::new('--limit', '--limit', [CompletionResultType]::ParameterName, 'Limit number of revisions to show')
            [CompletionResult]::new('-l', '-l', [CompletionResultType]::ParameterName, 'l')
            [CompletionResult]::new('-T', '-T ', [CompletionResultType]::ParameterName, 'Render each revision using the given template')
            [CompletionResult]::new('--template', '--template', [CompletionResultType]::ParameterName, 'Render each revision using the given template')
            [CompletionResult]::new('--tool', '--tool', [CompletionResultType]::ParameterName, 'Generate diff by external command')
            [CompletionResult]::new('--context', '--context', [CompletionResultType]::ParameterName, 'Number of lines of context to show')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--no-graph', '--no-graph', [CompletionResultType]::ParameterName, 'Don''t show the graph, show a flat list of revisions')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'Show patch compared to the previous version of this change')
            [CompletionResult]::new('--patch', '--patch', [CompletionResultType]::ParameterName, 'Show patch compared to the previous version of this change')
            [CompletionResult]::new('-s', '-s', [CompletionResultType]::ParameterName, 'For each path, show only whether it was modified, added, or deleted')
            [CompletionResult]::new('--summary', '--summary', [CompletionResultType]::ParameterName, 'For each path, show only whether it was modified, added, or deleted')
            [CompletionResult]::new('--stat', '--stat', [CompletionResultType]::ParameterName, 'Show a histogram of the changes')
            [CompletionResult]::new('--types', '--types', [CompletionResultType]::ParameterName, 'For each path, show only its type before and after')
            [CompletionResult]::new('--name-only', '--name-only', [CompletionResultType]::ParameterName, 'For each path, show only its path')
            [CompletionResult]::new('--git', '--git', [CompletionResultType]::ParameterName, 'Show a Git-format diff')
            [CompletionResult]::new('--color-words', '--color-words', [CompletionResultType]::ParameterName, 'Show a word-level diff with changes indicated only by color')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;file' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('chmod', 'chmod', [CompletionResultType]::ParameterValue, 'Sets or removes the executable bit for paths in the repo')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List files in a revision')
            [CompletionResult]::new('show', 'show', [CompletionResultType]::ParameterValue, 'Print contents of files in a revision')
            [CompletionResult]::new('track', 'track', [CompletionResultType]::ParameterValue, 'Start tracking specified paths in the working copy')
            [CompletionResult]::new('untrack', 'untrack', [CompletionResultType]::ParameterValue, 'Stop tracking specified paths in the working copy')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'jj;file;chmod' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'The revision to update')
            [CompletionResult]::new('--revision', '--revision', [CompletionResultType]::ParameterName, 'The revision to update')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;file;list' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'The revision to list files in')
            [CompletionResult]::new('--revision', '--revision', [CompletionResultType]::ParameterName, 'The revision to list files in')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;file;show' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'The revision to get the file contents from')
            [CompletionResult]::new('--revision', '--revision', [CompletionResultType]::ParameterName, 'The revision to get the file contents from')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;file;track' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;file;untrack' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;file;help' {
            [CompletionResult]::new('chmod', 'chmod', [CompletionResultType]::ParameterValue, 'Sets or removes the executable bit for paths in the repo')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List files in a revision')
            [CompletionResult]::new('show', 'show', [CompletionResultType]::ParameterValue, 'Print contents of files in a revision')
            [CompletionResult]::new('track', 'track', [CompletionResultType]::ParameterValue, 'Start tracking specified paths in the working copy')
            [CompletionResult]::new('untrack', 'untrack', [CompletionResultType]::ParameterValue, 'Stop tracking specified paths in the working copy')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'jj;file;help;chmod' {
            break
        }
        'jj;file;help;list' {
            break
        }
        'jj;file;help;show' {
            break
        }
        'jj;file;help;track' {
            break
        }
        'jj;file;help;untrack' {
            break
        }
        'jj;file;help;help' {
            break
        }
        'jj;files' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'The revision to list files in')
            [CompletionResult]::new('--revision', '--revision', [CompletionResultType]::ParameterName, 'The revision to list files in')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;fix' {
            [CompletionResult]::new('-s', '-s', [CompletionResultType]::ParameterName, 'Fix files in the specified revision(s) and their descendants. If no revisions are specified, this defaults to the `revsets.fix` setting, or `reachable(@, mutable())` if it is not set')
            [CompletionResult]::new('--source', '--source', [CompletionResultType]::ParameterName, 'Fix files in the specified revision(s) and their descendants. If no revisions are specified, this defaults to the `revsets.fix` setting, or `reachable(@, mutable())` if it is not set')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--include-unchanged-files', '--include-unchanged-files', [CompletionResultType]::ParameterName, 'Fix unchanged files in addition to changed ones. If no paths are specified, all files in the repo will be fixed')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;git' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('clone', 'clone', [CompletionResultType]::ParameterValue, 'Create a new repo backed by a clone of a Git repo')
            [CompletionResult]::new('export', 'export', [CompletionResultType]::ParameterValue, 'Update the underlying Git repo with changes made in the repo')
            [CompletionResult]::new('fetch', 'fetch', [CompletionResultType]::ParameterValue, 'Fetch from a Git remote')
            [CompletionResult]::new('import', 'import', [CompletionResultType]::ParameterValue, 'Update repo with changes made in the underlying Git repo')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Create a new Git backed repo')
            [CompletionResult]::new('push', 'push', [CompletionResultType]::ParameterValue, 'Push to a Git remote')
            [CompletionResult]::new('remote', 'remote', [CompletionResultType]::ParameterValue, 'Manage Git remotes')
            [CompletionResult]::new('submodule', 'submodule', [CompletionResultType]::ParameterValue, 'FOR INTERNAL USE ONLY Interact with git submodules')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'jj;git;clone' {
            [CompletionResult]::new('--remote', '--remote', [CompletionResultType]::ParameterName, 'Name of the newly created remote')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--colocate', '--colocate', [CompletionResultType]::ParameterName, 'Whether or not to colocate the Jujutsu repo with the git repo')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;git;export' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;git;fetch' {
            [CompletionResult]::new('-b', '-b', [CompletionResultType]::ParameterName, 'Fetch only some of the branches')
            [CompletionResult]::new('--branch', '--branch', [CompletionResultType]::ParameterName, 'Fetch only some of the branches')
            [CompletionResult]::new('--remote', '--remote', [CompletionResultType]::ParameterName, 'The remote to fetch from (only named remotes are supported, can be repeated)')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--all-remotes', '--all-remotes', [CompletionResultType]::ParameterName, 'Fetch from all remotes')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;git;import' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;git;init' {
            [CompletionResult]::new('--git-repo', '--git-repo', [CompletionResultType]::ParameterName, 'Specifies a path to an **existing** git repository to be used as the backing git repo for the newly created `jj` repo')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--colocate', '--colocate', [CompletionResultType]::ParameterName, 'Specifies that the `jj` repo should also be a valid `git` repo, allowing the use of both `jj` and `git` commands in the same directory')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;git;push' {
            [CompletionResult]::new('--remote', '--remote', [CompletionResultType]::ParameterName, 'The remote to push to (only named remotes are supported)')
            [CompletionResult]::new('-b', '-b', [CompletionResultType]::ParameterName, 'Push only this bookmark, or bookmarks matching a pattern (can be repeated)')
            [CompletionResult]::new('--bookmark', '--bookmark', [CompletionResultType]::ParameterName, 'Push only this bookmark, or bookmarks matching a pattern (can be repeated)')
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Push bookmarks pointing to these commits (can be repeated)')
            [CompletionResult]::new('--revisions', '--revisions', [CompletionResultType]::ParameterName, 'Push bookmarks pointing to these commits (can be repeated)')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'Push this commit by creating a bookmark based on its change ID (can be repeated)')
            [CompletionResult]::new('--change', '--change', [CompletionResultType]::ParameterName, 'Push this commit by creating a bookmark based on its change ID (can be repeated)')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--all', '--all', [CompletionResultType]::ParameterName, 'Push all bookmarks (including deleted bookmarks)')
            [CompletionResult]::new('--tracked', '--tracked', [CompletionResultType]::ParameterName, 'Push all tracked bookmarks (including deleted bookmarks)')
            [CompletionResult]::new('--deleted', '--deleted', [CompletionResultType]::ParameterName, 'Push all deleted bookmarks')
            [CompletionResult]::new('--allow-empty-description', '--allow-empty-description', [CompletionResultType]::ParameterName, 'Allow pushing commits with empty descriptions')
            [CompletionResult]::new('--allow-private', '--allow-private', [CompletionResultType]::ParameterName, 'Allow pushing commits that are private')
            [CompletionResult]::new('--dry-run', '--dry-run', [CompletionResultType]::ParameterName, 'Only display what will change on the remote')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;git;remote' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a Git remote')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List Git remotes')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove a Git remote and forget its bookmarks')
            [CompletionResult]::new('rename', 'rename', [CompletionResultType]::ParameterValue, 'Rename a Git remote')
            [CompletionResult]::new('set-url', 'set-url', [CompletionResultType]::ParameterValue, 'Set the URL of a Git remote')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'jj;git;remote;add' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;git;remote;list' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;git;remote;remove' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;git;remote;rename' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;git;remote;set-url' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;git;remote;help' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a Git remote')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List Git remotes')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove a Git remote and forget its bookmarks')
            [CompletionResult]::new('rename', 'rename', [CompletionResultType]::ParameterValue, 'Rename a Git remote')
            [CompletionResult]::new('set-url', 'set-url', [CompletionResultType]::ParameterValue, 'Set the URL of a Git remote')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'jj;git;remote;help;add' {
            break
        }
        'jj;git;remote;help;list' {
            break
        }
        'jj;git;remote;help;remove' {
            break
        }
        'jj;git;remote;help;rename' {
            break
        }
        'jj;git;remote;help;set-url' {
            break
        }
        'jj;git;remote;help;help' {
            break
        }
        'jj;git;submodule' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('print-gitmodules', 'print-gitmodules', [CompletionResultType]::ParameterValue, 'Print the relevant contents from .gitmodules. For debugging purposes only')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'jj;git;submodule;print-gitmodules' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Read .gitmodules from the given revision')
            [CompletionResult]::new('--revisions', '--revisions', [CompletionResultType]::ParameterName, 'Read .gitmodules from the given revision')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;git;submodule;help' {
            [CompletionResult]::new('print-gitmodules', 'print-gitmodules', [CompletionResultType]::ParameterValue, 'Print the relevant contents from .gitmodules. For debugging purposes only')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'jj;git;submodule;help;print-gitmodules' {
            break
        }
        'jj;git;submodule;help;help' {
            break
        }
        'jj;git;help' {
            [CompletionResult]::new('clone', 'clone', [CompletionResultType]::ParameterValue, 'Create a new repo backed by a clone of a Git repo')
            [CompletionResult]::new('export', 'export', [CompletionResultType]::ParameterValue, 'Update the underlying Git repo with changes made in the repo')
            [CompletionResult]::new('fetch', 'fetch', [CompletionResultType]::ParameterValue, 'Fetch from a Git remote')
            [CompletionResult]::new('import', 'import', [CompletionResultType]::ParameterValue, 'Update repo with changes made in the underlying Git repo')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Create a new Git backed repo')
            [CompletionResult]::new('push', 'push', [CompletionResultType]::ParameterValue, 'Push to a Git remote')
            [CompletionResult]::new('remote', 'remote', [CompletionResultType]::ParameterValue, 'Manage Git remotes')
            [CompletionResult]::new('submodule', 'submodule', [CompletionResultType]::ParameterValue, 'FOR INTERNAL USE ONLY Interact with git submodules')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'jj;git;help;clone' {
            break
        }
        'jj;git;help;export' {
            break
        }
        'jj;git;help;fetch' {
            break
        }
        'jj;git;help;import' {
            break
        }
        'jj;git;help;init' {
            break
        }
        'jj;git;help;push' {
            break
        }
        'jj;git;help;remote' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a Git remote')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List Git remotes')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove a Git remote and forget its bookmarks')
            [CompletionResult]::new('rename', 'rename', [CompletionResultType]::ParameterValue, 'Rename a Git remote')
            [CompletionResult]::new('set-url', 'set-url', [CompletionResultType]::ParameterValue, 'Set the URL of a Git remote')
            break
        }
        'jj;git;help;remote;add' {
            break
        }
        'jj;git;help;remote;list' {
            break
        }
        'jj;git;help;remote;remove' {
            break
        }
        'jj;git;help;remote;rename' {
            break
        }
        'jj;git;help;remote;set-url' {
            break
        }
        'jj;git;help;submodule' {
            [CompletionResult]::new('print-gitmodules', 'print-gitmodules', [CompletionResultType]::ParameterValue, 'Print the relevant contents from .gitmodules. For debugging purposes only')
            break
        }
        'jj;git;help;submodule;print-gitmodules' {
            break
        }
        'jj;git;help;help' {
            break
        }
        'jj;init' {
            [CompletionResult]::new('--git-repo', '--git-repo', [CompletionResultType]::ParameterName, 'DEPRECATED: Use `jj git init` Path to a git repo the jj repo will be backed by')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--git', '--git', [CompletionResultType]::ParameterName, 'DEPRECATED: Use `jj git init` Use the Git backend, creating a jj repo backed by a Git repo')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;interdiff' {
            [CompletionResult]::new('--from', '--from', [CompletionResultType]::ParameterName, 'Show changes from this revision')
            [CompletionResult]::new('--to', '--to', [CompletionResultType]::ParameterName, 'Show changes to this revision')
            [CompletionResult]::new('--tool', '--tool', [CompletionResultType]::ParameterName, 'Generate diff by external command')
            [CompletionResult]::new('--context', '--context', [CompletionResultType]::ParameterName, 'Number of lines of context to show')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('-s', '-s', [CompletionResultType]::ParameterName, 'For each path, show only whether it was modified, added, or deleted')
            [CompletionResult]::new('--summary', '--summary', [CompletionResultType]::ParameterName, 'For each path, show only whether it was modified, added, or deleted')
            [CompletionResult]::new('--stat', '--stat', [CompletionResultType]::ParameterName, 'Show a histogram of the changes')
            [CompletionResult]::new('--types', '--types', [CompletionResultType]::ParameterName, 'For each path, show only its type before and after')
            [CompletionResult]::new('--name-only', '--name-only', [CompletionResultType]::ParameterName, 'For each path, show only its path')
            [CompletionResult]::new('--git', '--git', [CompletionResultType]::ParameterName, 'Show a Git-format diff')
            [CompletionResult]::new('--color-words', '--color-words', [CompletionResultType]::ParameterName, 'Show a word-level diff with changes indicated only by color')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;log' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Which revisions to show')
            [CompletionResult]::new('--revisions', '--revisions', [CompletionResultType]::ParameterName, 'Which revisions to show')
            [CompletionResult]::new('-n', '-n', [CompletionResultType]::ParameterName, 'Limit number of revisions to show')
            [CompletionResult]::new('--limit', '--limit', [CompletionResultType]::ParameterName, 'Limit number of revisions to show')
            [CompletionResult]::new('-l', '-l', [CompletionResultType]::ParameterName, 'l')
            [CompletionResult]::new('-T', '-T ', [CompletionResultType]::ParameterName, 'Render each revision using the given template')
            [CompletionResult]::new('--template', '--template', [CompletionResultType]::ParameterName, 'Render each revision using the given template')
            [CompletionResult]::new('--tool', '--tool', [CompletionResultType]::ParameterName, 'Generate diff by external command')
            [CompletionResult]::new('--context', '--context', [CompletionResultType]::ParameterName, 'Number of lines of context to show')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--reversed', '--reversed', [CompletionResultType]::ParameterName, 'Show revisions in the opposite order (older revisions first)')
            [CompletionResult]::new('--no-graph', '--no-graph', [CompletionResultType]::ParameterName, 'Don''t show the graph, show a flat list of revisions')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'Show patch')
            [CompletionResult]::new('--patch', '--patch', [CompletionResultType]::ParameterName, 'Show patch')
            [CompletionResult]::new('-s', '-s', [CompletionResultType]::ParameterName, 'For each path, show only whether it was modified, added, or deleted')
            [CompletionResult]::new('--summary', '--summary', [CompletionResultType]::ParameterName, 'For each path, show only whether it was modified, added, or deleted')
            [CompletionResult]::new('--stat', '--stat', [CompletionResultType]::ParameterName, 'Show a histogram of the changes')
            [CompletionResult]::new('--types', '--types', [CompletionResultType]::ParameterName, 'For each path, show only its type before and after')
            [CompletionResult]::new('--name-only', '--name-only', [CompletionResultType]::ParameterName, 'For each path, show only its path')
            [CompletionResult]::new('--git', '--git', [CompletionResultType]::ParameterName, 'Show a Git-format diff')
            [CompletionResult]::new('--color-words', '--color-words', [CompletionResultType]::ParameterName, 'Show a word-level diff with changes indicated only by color')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;merge' {
            [CompletionResult]::new('-m', '-m', [CompletionResultType]::ParameterName, 'The change description to use')
            [CompletionResult]::new('--message', '--message', [CompletionResultType]::ParameterName, 'The change description to use')
            [CompletionResult]::new('-A', '-A ', [CompletionResultType]::ParameterName, 'Insert the new change after the given commit(s)')
            [CompletionResult]::new('--insert-after', '--insert-after', [CompletionResultType]::ParameterName, 'Insert the new change after the given commit(s)')
            [CompletionResult]::new('--after', '--after', [CompletionResultType]::ParameterName, 'Insert the new change after the given commit(s)')
            [CompletionResult]::new('-B', '-B ', [CompletionResultType]::ParameterName, 'Insert the new change before the given commit(s)')
            [CompletionResult]::new('--insert-before', '--insert-before', [CompletionResultType]::ParameterName, 'Insert the new change before the given commit(s)')
            [CompletionResult]::new('--before', '--before', [CompletionResultType]::ParameterName, 'Insert the new change before the given commit(s)')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Ignored (but lets you pass `-r` for consistency with other commands)')
            [CompletionResult]::new('--no-edit', '--no-edit', [CompletionResultType]::ParameterName, 'Do not edit the newly created change')
            [CompletionResult]::new('--edit', '--edit', [CompletionResultType]::ParameterName, 'No-op flag to pair with --no-edit')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;move' {
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Move part of this change into the destination')
            [CompletionResult]::new('--from', '--from', [CompletionResultType]::ParameterName, 'Move part of this change into the destination')
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Move part of the source into this change')
            [CompletionResult]::new('--to', '--to', [CompletionResultType]::ParameterName, 'Move part of the source into this change')
            [CompletionResult]::new('--tool', '--tool', [CompletionResultType]::ParameterName, 'Specify diff editor to be used (implies --interactive)')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('-i', '-i', [CompletionResultType]::ParameterName, 'Interactively choose which parts to move')
            [CompletionResult]::new('--interactive', '--interactive', [CompletionResultType]::ParameterName, 'Interactively choose which parts to move')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;new' {
            [CompletionResult]::new('-m', '-m', [CompletionResultType]::ParameterName, 'The change description to use')
            [CompletionResult]::new('--message', '--message', [CompletionResultType]::ParameterName, 'The change description to use')
            [CompletionResult]::new('-A', '-A ', [CompletionResultType]::ParameterName, 'Insert the new change after the given commit(s)')
            [CompletionResult]::new('--insert-after', '--insert-after', [CompletionResultType]::ParameterName, 'Insert the new change after the given commit(s)')
            [CompletionResult]::new('--after', '--after', [CompletionResultType]::ParameterName, 'Insert the new change after the given commit(s)')
            [CompletionResult]::new('-B', '-B ', [CompletionResultType]::ParameterName, 'Insert the new change before the given commit(s)')
            [CompletionResult]::new('--insert-before', '--insert-before', [CompletionResultType]::ParameterName, 'Insert the new change before the given commit(s)')
            [CompletionResult]::new('--before', '--before', [CompletionResultType]::ParameterName, 'Insert the new change before the given commit(s)')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Ignored (but lets you pass `-r` for consistency with other commands)')
            [CompletionResult]::new('--no-edit', '--no-edit', [CompletionResultType]::ParameterName, 'Do not edit the newly created change')
            [CompletionResult]::new('--edit', '--edit', [CompletionResultType]::ParameterName, 'No-op flag to pair with --no-edit')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;next' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'Instead of creating a new working-copy commit on top of the target commit (like `jj new`), edit the target commit directly (like `jj edit`)')
            [CompletionResult]::new('--edit', '--edit', [CompletionResultType]::ParameterName, 'Instead of creating a new working-copy commit on top of the target commit (like `jj new`), edit the target commit directly (like `jj edit`)')
            [CompletionResult]::new('-n', '-n', [CompletionResultType]::ParameterName, 'The inverse of `--edit`')
            [CompletionResult]::new('--no-edit', '--no-edit', [CompletionResultType]::ParameterName, 'The inverse of `--edit`')
            [CompletionResult]::new('--conflict', '--conflict', [CompletionResultType]::ParameterName, 'Jump to the next conflicted descendant')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;operation' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('abandon', 'abandon', [CompletionResultType]::ParameterValue, 'Abandon operation history')
            [CompletionResult]::new('diff', 'diff', [CompletionResultType]::ParameterValue, 'Compare changes to the repository between two operations')
            [CompletionResult]::new('log', 'log', [CompletionResultType]::ParameterValue, 'Show the operation log')
            [CompletionResult]::new('restore', 'restore', [CompletionResultType]::ParameterValue, 'Create a new operation that restores the repo to an earlier state')
            [CompletionResult]::new('show', 'show', [CompletionResultType]::ParameterValue, 'Show changes to the repository in an operation')
            [CompletionResult]::new('undo', 'undo', [CompletionResultType]::ParameterValue, 'Create a new operation that undoes an earlier operation')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'jj;op' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('abandon', 'abandon', [CompletionResultType]::ParameterValue, 'Abandon operation history')
            [CompletionResult]::new('diff', 'diff', [CompletionResultType]::ParameterValue, 'Compare changes to the repository between two operations')
            [CompletionResult]::new('log', 'log', [CompletionResultType]::ParameterValue, 'Show the operation log')
            [CompletionResult]::new('restore', 'restore', [CompletionResultType]::ParameterValue, 'Create a new operation that restores the repo to an earlier state')
            [CompletionResult]::new('show', 'show', [CompletionResultType]::ParameterValue, 'Show changes to the repository in an operation')
            [CompletionResult]::new('undo', 'undo', [CompletionResultType]::ParameterValue, 'Create a new operation that undoes an earlier operation')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'jj;operation;abandon' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;op;abandon' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;operation;diff' {
            [CompletionResult]::new('--operation', '--operation', [CompletionResultType]::ParameterName, 'Show repository changes in this operation, compared to its parent')
            [CompletionResult]::new('--op', '--op', [CompletionResultType]::ParameterName, 'Show repository changes in this operation, compared to its parent')
            [CompletionResult]::new('--from', '--from', [CompletionResultType]::ParameterName, 'Show repository changes from this operation')
            [CompletionResult]::new('--to', '--to', [CompletionResultType]::ParameterName, 'Show repository changes to this operation')
            [CompletionResult]::new('--tool', '--tool', [CompletionResultType]::ParameterName, 'Generate diff by external command')
            [CompletionResult]::new('--context', '--context', [CompletionResultType]::ParameterName, 'Number of lines of context to show')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--no-graph', '--no-graph', [CompletionResultType]::ParameterName, 'Don''t show the graph, show a flat list of modified changes')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'Show patch of modifications to changes')
            [CompletionResult]::new('--patch', '--patch', [CompletionResultType]::ParameterName, 'Show patch of modifications to changes')
            [CompletionResult]::new('-s', '-s', [CompletionResultType]::ParameterName, 'For each path, show only whether it was modified, added, or deleted')
            [CompletionResult]::new('--summary', '--summary', [CompletionResultType]::ParameterName, 'For each path, show only whether it was modified, added, or deleted')
            [CompletionResult]::new('--stat', '--stat', [CompletionResultType]::ParameterName, 'Show a histogram of the changes')
            [CompletionResult]::new('--types', '--types', [CompletionResultType]::ParameterName, 'For each path, show only its type before and after')
            [CompletionResult]::new('--name-only', '--name-only', [CompletionResultType]::ParameterName, 'For each path, show only its path')
            [CompletionResult]::new('--git', '--git', [CompletionResultType]::ParameterName, 'Show a Git-format diff')
            [CompletionResult]::new('--color-words', '--color-words', [CompletionResultType]::ParameterName, 'Show a word-level diff with changes indicated only by color')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;op;diff' {
            [CompletionResult]::new('--operation', '--operation', [CompletionResultType]::ParameterName, 'Show repository changes in this operation, compared to its parent')
            [CompletionResult]::new('--op', '--op', [CompletionResultType]::ParameterName, 'Show repository changes in this operation, compared to its parent')
            [CompletionResult]::new('--from', '--from', [CompletionResultType]::ParameterName, 'Show repository changes from this operation')
            [CompletionResult]::new('--to', '--to', [CompletionResultType]::ParameterName, 'Show repository changes to this operation')
            [CompletionResult]::new('--tool', '--tool', [CompletionResultType]::ParameterName, 'Generate diff by external command')
            [CompletionResult]::new('--context', '--context', [CompletionResultType]::ParameterName, 'Number of lines of context to show')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--no-graph', '--no-graph', [CompletionResultType]::ParameterName, 'Don''t show the graph, show a flat list of modified changes')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'Show patch of modifications to changes')
            [CompletionResult]::new('--patch', '--patch', [CompletionResultType]::ParameterName, 'Show patch of modifications to changes')
            [CompletionResult]::new('-s', '-s', [CompletionResultType]::ParameterName, 'For each path, show only whether it was modified, added, or deleted')
            [CompletionResult]::new('--summary', '--summary', [CompletionResultType]::ParameterName, 'For each path, show only whether it was modified, added, or deleted')
            [CompletionResult]::new('--stat', '--stat', [CompletionResultType]::ParameterName, 'Show a histogram of the changes')
            [CompletionResult]::new('--types', '--types', [CompletionResultType]::ParameterName, 'For each path, show only its type before and after')
            [CompletionResult]::new('--name-only', '--name-only', [CompletionResultType]::ParameterName, 'For each path, show only its path')
            [CompletionResult]::new('--git', '--git', [CompletionResultType]::ParameterName, 'Show a Git-format diff')
            [CompletionResult]::new('--color-words', '--color-words', [CompletionResultType]::ParameterName, 'Show a word-level diff with changes indicated only by color')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;operation;log' {
            [CompletionResult]::new('-n', '-n', [CompletionResultType]::ParameterName, 'Limit number of operations to show')
            [CompletionResult]::new('--limit', '--limit', [CompletionResultType]::ParameterName, 'Limit number of operations to show')
            [CompletionResult]::new('-l', '-l', [CompletionResultType]::ParameterName, 'l')
            [CompletionResult]::new('-T', '-T ', [CompletionResultType]::ParameterName, 'Render each operation using the given template')
            [CompletionResult]::new('--template', '--template', [CompletionResultType]::ParameterName, 'Render each operation using the given template')
            [CompletionResult]::new('--tool', '--tool', [CompletionResultType]::ParameterName, 'Generate diff by external command')
            [CompletionResult]::new('--context', '--context', [CompletionResultType]::ParameterName, 'Number of lines of context to show')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--no-graph', '--no-graph', [CompletionResultType]::ParameterName, 'Don''t show the graph, show a flat list of operations')
            [CompletionResult]::new('--op-diff', '--op-diff', [CompletionResultType]::ParameterName, 'Show changes to the repository at each operation')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'Show patch of modifications to changes (implies --op-diff)')
            [CompletionResult]::new('--patch', '--patch', [CompletionResultType]::ParameterName, 'Show patch of modifications to changes (implies --op-diff)')
            [CompletionResult]::new('-s', '-s', [CompletionResultType]::ParameterName, 'For each path, show only whether it was modified, added, or deleted')
            [CompletionResult]::new('--summary', '--summary', [CompletionResultType]::ParameterName, 'For each path, show only whether it was modified, added, or deleted')
            [CompletionResult]::new('--stat', '--stat', [CompletionResultType]::ParameterName, 'Show a histogram of the changes')
            [CompletionResult]::new('--types', '--types', [CompletionResultType]::ParameterName, 'For each path, show only its type before and after')
            [CompletionResult]::new('--name-only', '--name-only', [CompletionResultType]::ParameterName, 'For each path, show only its path')
            [CompletionResult]::new('--git', '--git', [CompletionResultType]::ParameterName, 'Show a Git-format diff')
            [CompletionResult]::new('--color-words', '--color-words', [CompletionResultType]::ParameterName, 'Show a word-level diff with changes indicated only by color')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;op;log' {
            [CompletionResult]::new('-n', '-n', [CompletionResultType]::ParameterName, 'Limit number of operations to show')
            [CompletionResult]::new('--limit', '--limit', [CompletionResultType]::ParameterName, 'Limit number of operations to show')
            [CompletionResult]::new('-l', '-l', [CompletionResultType]::ParameterName, 'l')
            [CompletionResult]::new('-T', '-T ', [CompletionResultType]::ParameterName, 'Render each operation using the given template')
            [CompletionResult]::new('--template', '--template', [CompletionResultType]::ParameterName, 'Render each operation using the given template')
            [CompletionResult]::new('--tool', '--tool', [CompletionResultType]::ParameterName, 'Generate diff by external command')
            [CompletionResult]::new('--context', '--context', [CompletionResultType]::ParameterName, 'Number of lines of context to show')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--no-graph', '--no-graph', [CompletionResultType]::ParameterName, 'Don''t show the graph, show a flat list of operations')
            [CompletionResult]::new('--op-diff', '--op-diff', [CompletionResultType]::ParameterName, 'Show changes to the repository at each operation')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'Show patch of modifications to changes (implies --op-diff)')
            [CompletionResult]::new('--patch', '--patch', [CompletionResultType]::ParameterName, 'Show patch of modifications to changes (implies --op-diff)')
            [CompletionResult]::new('-s', '-s', [CompletionResultType]::ParameterName, 'For each path, show only whether it was modified, added, or deleted')
            [CompletionResult]::new('--summary', '--summary', [CompletionResultType]::ParameterName, 'For each path, show only whether it was modified, added, or deleted')
            [CompletionResult]::new('--stat', '--stat', [CompletionResultType]::ParameterName, 'Show a histogram of the changes')
            [CompletionResult]::new('--types', '--types', [CompletionResultType]::ParameterName, 'For each path, show only its type before and after')
            [CompletionResult]::new('--name-only', '--name-only', [CompletionResultType]::ParameterName, 'For each path, show only its path')
            [CompletionResult]::new('--git', '--git', [CompletionResultType]::ParameterName, 'Show a Git-format diff')
            [CompletionResult]::new('--color-words', '--color-words', [CompletionResultType]::ParameterName, 'Show a word-level diff with changes indicated only by color')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;operation;restore' {
            [CompletionResult]::new('--what', '--what', [CompletionResultType]::ParameterName, 'What portions of the local state to restore (can be repeated)')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;op;restore' {
            [CompletionResult]::new('--what', '--what', [CompletionResultType]::ParameterName, 'What portions of the local state to restore (can be repeated)')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;operation;show' {
            [CompletionResult]::new('--tool', '--tool', [CompletionResultType]::ParameterName, 'Generate diff by external command')
            [CompletionResult]::new('--context', '--context', [CompletionResultType]::ParameterName, 'Number of lines of context to show')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--no-graph', '--no-graph', [CompletionResultType]::ParameterName, 'Don''t show the graph, show a flat list of modified changes')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'Show patch of modifications to changes')
            [CompletionResult]::new('--patch', '--patch', [CompletionResultType]::ParameterName, 'Show patch of modifications to changes')
            [CompletionResult]::new('-s', '-s', [CompletionResultType]::ParameterName, 'For each path, show only whether it was modified, added, or deleted')
            [CompletionResult]::new('--summary', '--summary', [CompletionResultType]::ParameterName, 'For each path, show only whether it was modified, added, or deleted')
            [CompletionResult]::new('--stat', '--stat', [CompletionResultType]::ParameterName, 'Show a histogram of the changes')
            [CompletionResult]::new('--types', '--types', [CompletionResultType]::ParameterName, 'For each path, show only its type before and after')
            [CompletionResult]::new('--name-only', '--name-only', [CompletionResultType]::ParameterName, 'For each path, show only its path')
            [CompletionResult]::new('--git', '--git', [CompletionResultType]::ParameterName, 'Show a Git-format diff')
            [CompletionResult]::new('--color-words', '--color-words', [CompletionResultType]::ParameterName, 'Show a word-level diff with changes indicated only by color')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;op;show' {
            [CompletionResult]::new('--tool', '--tool', [CompletionResultType]::ParameterName, 'Generate diff by external command')
            [CompletionResult]::new('--context', '--context', [CompletionResultType]::ParameterName, 'Number of lines of context to show')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--no-graph', '--no-graph', [CompletionResultType]::ParameterName, 'Don''t show the graph, show a flat list of modified changes')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'Show patch of modifications to changes')
            [CompletionResult]::new('--patch', '--patch', [CompletionResultType]::ParameterName, 'Show patch of modifications to changes')
            [CompletionResult]::new('-s', '-s', [CompletionResultType]::ParameterName, 'For each path, show only whether it was modified, added, or deleted')
            [CompletionResult]::new('--summary', '--summary', [CompletionResultType]::ParameterName, 'For each path, show only whether it was modified, added, or deleted')
            [CompletionResult]::new('--stat', '--stat', [CompletionResultType]::ParameterName, 'Show a histogram of the changes')
            [CompletionResult]::new('--types', '--types', [CompletionResultType]::ParameterName, 'For each path, show only its type before and after')
            [CompletionResult]::new('--name-only', '--name-only', [CompletionResultType]::ParameterName, 'For each path, show only its path')
            [CompletionResult]::new('--git', '--git', [CompletionResultType]::ParameterName, 'Show a Git-format diff')
            [CompletionResult]::new('--color-words', '--color-words', [CompletionResultType]::ParameterName, 'Show a word-level diff with changes indicated only by color')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;operation;undo' {
            [CompletionResult]::new('--what', '--what', [CompletionResultType]::ParameterName, 'What portions of the local state to restore (can be repeated)')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;op;undo' {
            [CompletionResult]::new('--what', '--what', [CompletionResultType]::ParameterName, 'What portions of the local state to restore (can be repeated)')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;operation;help' {
            [CompletionResult]::new('abandon', 'abandon', [CompletionResultType]::ParameterValue, 'Abandon operation history')
            [CompletionResult]::new('diff', 'diff', [CompletionResultType]::ParameterValue, 'Compare changes to the repository between two operations')
            [CompletionResult]::new('log', 'log', [CompletionResultType]::ParameterValue, 'Show the operation log')
            [CompletionResult]::new('restore', 'restore', [CompletionResultType]::ParameterValue, 'Create a new operation that restores the repo to an earlier state')
            [CompletionResult]::new('show', 'show', [CompletionResultType]::ParameterValue, 'Show changes to the repository in an operation')
            [CompletionResult]::new('undo', 'undo', [CompletionResultType]::ParameterValue, 'Create a new operation that undoes an earlier operation')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'jj;operation;help;abandon' {
            break
        }
        'jj;operation;help;diff' {
            break
        }
        'jj;operation;help;log' {
            break
        }
        'jj;operation;help;restore' {
            break
        }
        'jj;operation;help;show' {
            break
        }
        'jj;operation;help;undo' {
            break
        }
        'jj;operation;help;help' {
            break
        }
        'jj;op;help' {
            [CompletionResult]::new('abandon', 'abandon', [CompletionResultType]::ParameterValue, 'Abandon operation history')
            [CompletionResult]::new('diff', 'diff', [CompletionResultType]::ParameterValue, 'Compare changes to the repository between two operations')
            [CompletionResult]::new('log', 'log', [CompletionResultType]::ParameterValue, 'Show the operation log')
            [CompletionResult]::new('restore', 'restore', [CompletionResultType]::ParameterValue, 'Create a new operation that restores the repo to an earlier state')
            [CompletionResult]::new('show', 'show', [CompletionResultType]::ParameterValue, 'Show changes to the repository in an operation')
            [CompletionResult]::new('undo', 'undo', [CompletionResultType]::ParameterValue, 'Create a new operation that undoes an earlier operation')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'jj;op;help;abandon' {
            break
        }
        'jj;op;help;diff' {
            break
        }
        'jj;op;help;log' {
            break
        }
        'jj;op;help;restore' {
            break
        }
        'jj;op;help;show' {
            break
        }
        'jj;op;help;undo' {
            break
        }
        'jj;op;help;help' {
            break
        }
        'jj;parallelize' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;prev' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'Edit the parent directly, instead of moving the working-copy commit')
            [CompletionResult]::new('--edit', '--edit', [CompletionResultType]::ParameterName, 'Edit the parent directly, instead of moving the working-copy commit')
            [CompletionResult]::new('-n', '-n', [CompletionResultType]::ParameterName, 'The inverse of `--edit`')
            [CompletionResult]::new('--no-edit', '--no-edit', [CompletionResultType]::ParameterName, 'The inverse of `--edit`')
            [CompletionResult]::new('--conflict', '--conflict', [CompletionResultType]::ParameterName, 'Jump to the previous conflicted ancestor')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;rebase' {
            [CompletionResult]::new('-b', '-b', [CompletionResultType]::ParameterName, 'Rebase the whole branch relative to destination''s ancestors (can be repeated)')
            [CompletionResult]::new('--branch', '--branch', [CompletionResultType]::ParameterName, 'Rebase the whole branch relative to destination''s ancestors (can be repeated)')
            [CompletionResult]::new('-s', '-s', [CompletionResultType]::ParameterName, 'Rebase specified revision(s) together with their trees of descendants (can be repeated)')
            [CompletionResult]::new('--source', '--source', [CompletionResultType]::ParameterName, 'Rebase specified revision(s) together with their trees of descendants (can be repeated)')
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Rebase the given revisions, rebasing descendants onto this revision''s parent(s)')
            [CompletionResult]::new('--revisions', '--revisions', [CompletionResultType]::ParameterName, 'Rebase the given revisions, rebasing descendants onto this revision''s parent(s)')
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'The revision(s) to rebase onto (can be repeated to create a merge commit)')
            [CompletionResult]::new('--destination', '--destination', [CompletionResultType]::ParameterName, 'The revision(s) to rebase onto (can be repeated to create a merge commit)')
            [CompletionResult]::new('-A', '-A ', [CompletionResultType]::ParameterName, 'The revision(s) to insert after (can be repeated to create a merge commit)')
            [CompletionResult]::new('--insert-after', '--insert-after', [CompletionResultType]::ParameterName, 'The revision(s) to insert after (can be repeated to create a merge commit)')
            [CompletionResult]::new('--after', '--after', [CompletionResultType]::ParameterName, 'The revision(s) to insert after (can be repeated to create a merge commit)')
            [CompletionResult]::new('-B', '-B ', [CompletionResultType]::ParameterName, 'The revision(s) to insert before (can be repeated to create a merge commit)')
            [CompletionResult]::new('--insert-before', '--insert-before', [CompletionResultType]::ParameterName, 'The revision(s) to insert before (can be repeated to create a merge commit)')
            [CompletionResult]::new('--before', '--before', [CompletionResultType]::ParameterName, 'The revision(s) to insert before (can be repeated to create a merge commit)')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--skip-empty', '--skip-empty', [CompletionResultType]::ParameterName, 'Deprecated. Use --skip-emptied instead')
            [CompletionResult]::new('--skip-emptied', '--skip-emptied', [CompletionResultType]::ParameterName, 'If true, when rebasing would produce an empty commit, the commit is abandoned. It will not be abandoned if it was already empty before the rebase. Will never skip merge commits with multiple non-empty parents')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;resolve' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'r')
            [CompletionResult]::new('--revision', '--revision', [CompletionResultType]::ParameterName, 'revision')
            [CompletionResult]::new('--tool', '--tool', [CompletionResultType]::ParameterName, 'Specify 3-way merge tool to be used')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('-l', '-l', [CompletionResultType]::ParameterName, 'Instead of resolving one conflict, list all the conflicts')
            [CompletionResult]::new('--list', '--list', [CompletionResultType]::ParameterName, 'Instead of resolving one conflict, list all the conflicts')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;restore' {
            [CompletionResult]::new('--from', '--from', [CompletionResultType]::ParameterName, 'Revision to restore from (source)')
            [CompletionResult]::new('--to', '--to', [CompletionResultType]::ParameterName, 'Revision to restore into (destination)')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'Undo the changes in a revision as compared to the merge of its parents')
            [CompletionResult]::new('--changes-in', '--changes-in', [CompletionResultType]::ParameterName, 'Undo the changes in a revision as compared to the merge of its parents')
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Prints an error. DO NOT USE')
            [CompletionResult]::new('--revision', '--revision', [CompletionResultType]::ParameterName, 'Prints an error. DO NOT USE')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--restore-descendants', '--restore-descendants', [CompletionResultType]::ParameterName, 'Preserve the content (not the diff) when rebasing descendants')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;revert' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;root' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;run' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'The revisions to change')
            [CompletionResult]::new('--revisions', '--revisions', [CompletionResultType]::ParameterName, 'The revisions to change')
            [CompletionResult]::new('-j', '-j', [CompletionResultType]::ParameterName, 'How many processes should run in parallel, uses by default all cores')
            [CompletionResult]::new('--jobs', '--jobs', [CompletionResultType]::ParameterName, 'How many processes should run in parallel, uses by default all cores')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('-x', '-x', [CompletionResultType]::ParameterName, 'A no-op option to match the interface of `git rebase -x`')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;show' {
            [CompletionResult]::new('-T', '-T ', [CompletionResultType]::ParameterName, 'Render a revision using the given template')
            [CompletionResult]::new('--template', '--template', [CompletionResultType]::ParameterName, 'Render a revision using the given template')
            [CompletionResult]::new('--tool', '--tool', [CompletionResultType]::ParameterName, 'Generate diff by external command')
            [CompletionResult]::new('--context', '--context', [CompletionResultType]::ParameterName, 'Number of lines of context to show')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Ignored (but lets you pass `-r` for consistency with other commands)')
            [CompletionResult]::new('-s', '-s', [CompletionResultType]::ParameterName, 'For each path, show only whether it was modified, added, or deleted')
            [CompletionResult]::new('--summary', '--summary', [CompletionResultType]::ParameterName, 'For each path, show only whether it was modified, added, or deleted')
            [CompletionResult]::new('--stat', '--stat', [CompletionResultType]::ParameterName, 'Show a histogram of the changes')
            [CompletionResult]::new('--types', '--types', [CompletionResultType]::ParameterName, 'For each path, show only its type before and after')
            [CompletionResult]::new('--name-only', '--name-only', [CompletionResultType]::ParameterName, 'For each path, show only its path')
            [CompletionResult]::new('--git', '--git', [CompletionResultType]::ParameterName, 'Show a Git-format diff')
            [CompletionResult]::new('--color-words', '--color-words', [CompletionResultType]::ParameterName, 'Show a word-level diff with changes indicated only by color')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;sparse' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('edit', 'edit', [CompletionResultType]::ParameterValue, 'Start an editor to update the patterns that are present in the working copy')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List the patterns that are currently present in the working copy')
            [CompletionResult]::new('reset', 'reset', [CompletionResultType]::ParameterValue, 'Reset the patterns to include all files in the working copy')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Update the patterns that are present in the working copy')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'jj;sparse;edit' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;sparse;list' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;sparse;reset' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;sparse;set' {
            [CompletionResult]::new('--add', '--add', [CompletionResultType]::ParameterName, 'Patterns to add to the working copy')
            [CompletionResult]::new('--remove', '--remove', [CompletionResultType]::ParameterName, 'Patterns to remove from the working copy')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--clear', '--clear', [CompletionResultType]::ParameterName, 'Include no files in the working copy (combine with --add)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;sparse;help' {
            [CompletionResult]::new('edit', 'edit', [CompletionResultType]::ParameterValue, 'Start an editor to update the patterns that are present in the working copy')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List the patterns that are currently present in the working copy')
            [CompletionResult]::new('reset', 'reset', [CompletionResultType]::ParameterValue, 'Reset the patterns to include all files in the working copy')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Update the patterns that are present in the working copy')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'jj;sparse;help;edit' {
            break
        }
        'jj;sparse;help;list' {
            break
        }
        'jj;sparse;help;reset' {
            break
        }
        'jj;sparse;help;set' {
            break
        }
        'jj;sparse;help;help' {
            break
        }
        'jj;split' {
            [CompletionResult]::new('--tool', '--tool', [CompletionResultType]::ParameterName, 'Specify diff editor to be used (implies --interactive)')
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'The revision to split')
            [CompletionResult]::new('--revision', '--revision', [CompletionResultType]::ParameterName, 'The revision to split')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('-i', '-i', [CompletionResultType]::ParameterName, 'Interactively choose which parts to split. This is the default if no paths are provided')
            [CompletionResult]::new('--interactive', '--interactive', [CompletionResultType]::ParameterName, 'Interactively choose which parts to split. This is the default if no paths are provided')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'Split the revision into two parallel revisions instead of a parent and child')
            [CompletionResult]::new('--parallel', '--parallel', [CompletionResultType]::ParameterName, 'Split the revision into two parallel revisions instead of a parent and child')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;squash' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Revision to squash into its parent (default: @)')
            [CompletionResult]::new('--revision', '--revision', [CompletionResultType]::ParameterName, 'Revision to squash into its parent (default: @)')
            [CompletionResult]::new('--from', '--from', [CompletionResultType]::ParameterName, 'Revision(s) to squash from (default: @)')
            [CompletionResult]::new('--into', '--into', [CompletionResultType]::ParameterName, 'Revision to squash into (default: @)')
            [CompletionResult]::new('--to', '--to', [CompletionResultType]::ParameterName, 'Revision to squash into (default: @)')
            [CompletionResult]::new('-m', '-m', [CompletionResultType]::ParameterName, 'The description to use for squashed revision (don''t open editor)')
            [CompletionResult]::new('--message', '--message', [CompletionResultType]::ParameterName, 'The description to use for squashed revision (don''t open editor)')
            [CompletionResult]::new('--tool', '--tool', [CompletionResultType]::ParameterName, 'Specify diff editor to be used (implies --interactive)')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('-u', '-u', [CompletionResultType]::ParameterName, 'Use the description of the destination revision and discard the description(s) of the source revision(s)')
            [CompletionResult]::new('--use-destination-message', '--use-destination-message', [CompletionResultType]::ParameterName, 'Use the description of the destination revision and discard the description(s) of the source revision(s)')
            [CompletionResult]::new('-i', '-i', [CompletionResultType]::ParameterName, 'Interactively choose which parts to squash')
            [CompletionResult]::new('--interactive', '--interactive', [CompletionResultType]::ParameterName, 'Interactively choose which parts to squash')
            [CompletionResult]::new('-k', '-k', [CompletionResultType]::ParameterName, 'The source revision will not be abandoned')
            [CompletionResult]::new('--keep-emptied', '--keep-emptied', [CompletionResultType]::ParameterName, 'The source revision will not be abandoned')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;status' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;st' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;tag' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List tags')
            [CompletionResult]::new('l', 'l', [CompletionResultType]::ParameterValue, 'List tags')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'jj;tag;list' {
            [CompletionResult]::new('-T', '-T ', [CompletionResultType]::ParameterName, 'Render each tag using the given template')
            [CompletionResult]::new('--template', '--template', [CompletionResultType]::ParameterName, 'Render each tag using the given template')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;tag;l' {
            [CompletionResult]::new('-T', '-T ', [CompletionResultType]::ParameterName, 'Render each tag using the given template')
            [CompletionResult]::new('--template', '--template', [CompletionResultType]::ParameterName, 'Render each tag using the given template')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;tag;help' {
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List tags')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'jj;tag;help;list' {
            break
        }
        'jj;tag;help;help' {
            break
        }
        'jj;util' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('completion', 'completion', [CompletionResultType]::ParameterValue, 'Print a command-line-completion script')
            [CompletionResult]::new('gc', 'gc', [CompletionResultType]::ParameterValue, 'Run backend-dependent garbage collection')
            [CompletionResult]::new('mangen', 'mangen', [CompletionResultType]::ParameterValue, 'Print a ROFF (manpage)')
            [CompletionResult]::new('markdown-help', 'markdown-help', [CompletionResultType]::ParameterValue, 'Print the CLI help for all subcommands in Markdown')
            [CompletionResult]::new('config-schema', 'config-schema', [CompletionResultType]::ParameterValue, 'Print the JSON schema for the jj TOML config format')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'jj;util;completion' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--bash', '--bash', [CompletionResultType]::ParameterName, 'Deprecated. Use the SHELL positional argument instead')
            [CompletionResult]::new('--fish', '--fish', [CompletionResultType]::ParameterName, 'Deprecated. Use the SHELL positional argument instead')
            [CompletionResult]::new('--zsh', '--zsh', [CompletionResultType]::ParameterName, 'Deprecated. Use the SHELL positional argument instead')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;util;gc' {
            [CompletionResult]::new('--expire', '--expire', [CompletionResultType]::ParameterName, 'Time threshold')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;util;mangen' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;util;markdown-help' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;util;config-schema' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;util;help' {
            [CompletionResult]::new('completion', 'completion', [CompletionResultType]::ParameterValue, 'Print a command-line-completion script')
            [CompletionResult]::new('gc', 'gc', [CompletionResultType]::ParameterValue, 'Run backend-dependent garbage collection')
            [CompletionResult]::new('mangen', 'mangen', [CompletionResultType]::ParameterValue, 'Print a ROFF (manpage)')
            [CompletionResult]::new('markdown-help', 'markdown-help', [CompletionResultType]::ParameterValue, 'Print the CLI help for all subcommands in Markdown')
            [CompletionResult]::new('config-schema', 'config-schema', [CompletionResultType]::ParameterValue, 'Print the JSON schema for the jj TOML config format')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'jj;util;help;completion' {
            break
        }
        'jj;util;help;gc' {
            break
        }
        'jj;util;help;mangen' {
            break
        }
        'jj;util;help;markdown-help' {
            break
        }
        'jj;util;help;config-schema' {
            break
        }
        'jj;util;help;help' {
            break
        }
        'jj;undo' {
            [CompletionResult]::new('--what', '--what', [CompletionResultType]::ParameterName, 'What portions of the local state to restore (can be repeated)')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;unsquash' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'r')
            [CompletionResult]::new('--revision', '--revision', [CompletionResultType]::ParameterName, 'revision')
            [CompletionResult]::new('--tool', '--tool', [CompletionResultType]::ParameterName, 'Specify diff editor to be used (implies --interactive)')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('-i', '-i', [CompletionResultType]::ParameterName, 'Interactively choose which parts to unsquash')
            [CompletionResult]::new('--interactive', '--interactive', [CompletionResultType]::ParameterName, 'Interactively choose which parts to unsquash')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;untrack' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;version' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;workspace' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a workspace')
            [CompletionResult]::new('forget', 'forget', [CompletionResultType]::ParameterValue, 'Stop tracking a workspace''s working-copy commit in the repo')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List workspaces')
            [CompletionResult]::new('rename', 'rename', [CompletionResultType]::ParameterValue, 'Renames the current workspace')
            [CompletionResult]::new('root', 'root', [CompletionResultType]::ParameterValue, 'Show the current workspace root directory')
            [CompletionResult]::new('update-stale', 'update-stale', [CompletionResultType]::ParameterValue, 'Update a workspace that has become stale')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'jj;workspace;add' {
            [CompletionResult]::new('--name', '--name', [CompletionResultType]::ParameterName, 'A name for the workspace')
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'A list of parent revisions for the working-copy commit of the newly created workspace. You may specify nothing, or any number of parents')
            [CompletionResult]::new('--revision', '--revision', [CompletionResultType]::ParameterName, 'A list of parent revisions for the working-copy commit of the newly created workspace. You may specify nothing, or any number of parents')
            [CompletionResult]::new('--sparse-patterns', '--sparse-patterns', [CompletionResultType]::ParameterName, 'How to handle sparse patterns when creating a new workspace')
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;workspace;forget' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;workspace;list' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;workspace;rename' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;workspace;root' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;workspace;update-stale' {
            [CompletionResult]::new('-R', '-R ', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--repository', '--repository', [CompletionResultType]::ParameterName, 'Path to repository to operate on')
            [CompletionResult]::new('--at-operation', '--at-operation', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--at-op', '--at-op', [CompletionResultType]::ParameterName, 'Operation to load the repo at')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'When to colorize output (always, never, debug, auto)')
            [CompletionResult]::new('--config-toml', '--config-toml', [CompletionResultType]::ParameterName, 'Additional configuration options (can be repeated)')
            [CompletionResult]::new('--ignore-working-copy', '--ignore-working-copy', [CompletionResultType]::ParameterName, 'Don''t snapshot the working copy, and don''t update it')
            [CompletionResult]::new('--ignore-immutable', '--ignore-immutable', [CompletionResultType]::ParameterName, 'Allow rewriting immutable commits')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug logging')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Silence non-primary command output')
            [CompletionResult]::new('--no-pager', '--no-pager', [CompletionResultType]::ParameterName, 'Disable the pager')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'jj;workspace;help' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a workspace')
            [CompletionResult]::new('forget', 'forget', [CompletionResultType]::ParameterValue, 'Stop tracking a workspace''s working-copy commit in the repo')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List workspaces')
            [CompletionResult]::new('rename', 'rename', [CompletionResultType]::ParameterValue, 'Renames the current workspace')
            [CompletionResult]::new('root', 'root', [CompletionResultType]::ParameterValue, 'Show the current workspace root directory')
            [CompletionResult]::new('update-stale', 'update-stale', [CompletionResultType]::ParameterValue, 'Update a workspace that has become stale')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'jj;workspace;help;add' {
            break
        }
        'jj;workspace;help;forget' {
            break
        }
        'jj;workspace;help;list' {
            break
        }
        'jj;workspace;help;rename' {
            break
        }
        'jj;workspace;help;root' {
            break
        }
        'jj;workspace;help;update-stale' {
            break
        }
        'jj;workspace;help;help' {
            break
        }
        'jj;help' {
            [CompletionResult]::new('abandon', 'abandon', [CompletionResultType]::ParameterValue, 'Abandon a revision')
            [CompletionResult]::new('backout', 'backout', [CompletionResultType]::ParameterValue, 'Apply the reverse of a revision on top of another revision')
            [CompletionResult]::new('bookmark', 'bookmark', [CompletionResultType]::ParameterValue, 'Manage bookmarks')
            [CompletionResult]::new('branch', 'branch', [CompletionResultType]::ParameterValue, 'Manage bookmarks')
            [CompletionResult]::new('cat', 'cat', [CompletionResultType]::ParameterValue, 'Print contents of files in a revision')
            [CompletionResult]::new('checkout', 'checkout', [CompletionResultType]::ParameterValue, 'Create a new, empty change and edit it in the working copy (DEPRECATED, use `jj new`)')
            [CompletionResult]::new('chmod', 'chmod', [CompletionResultType]::ParameterValue, 'Sets or removes the executable bit for paths in the repo')
            [CompletionResult]::new('commit', 'commit', [CompletionResultType]::ParameterValue, 'Update the description and create a new change on top')
            [CompletionResult]::new('config', 'config', [CompletionResultType]::ParameterValue, 'Manage config options')
            [CompletionResult]::new('debug', 'debug', [CompletionResultType]::ParameterValue, 'Low-level commands not intended for users')
            [CompletionResult]::new('describe', 'describe', [CompletionResultType]::ParameterValue, 'Update the change description or other metadata')
            [CompletionResult]::new('diff', 'diff', [CompletionResultType]::ParameterValue, 'Compare file contents between two revisions')
            [CompletionResult]::new('diffedit', 'diffedit', [CompletionResultType]::ParameterValue, 'Touch up the content changes in a revision with a diff editor')
            [CompletionResult]::new('duplicate', 'duplicate', [CompletionResultType]::ParameterValue, 'Create a new change with the same content as an existing one')
            [CompletionResult]::new('edit', 'edit', [CompletionResultType]::ParameterValue, 'Sets the specified revision as the working-copy revision')
            [CompletionResult]::new('evolog', 'evolog', [CompletionResultType]::ParameterValue, 'Show how a change has evolved over time')
            [CompletionResult]::new('file', 'file', [CompletionResultType]::ParameterValue, 'File operations')
            [CompletionResult]::new('files', 'files', [CompletionResultType]::ParameterValue, 'List files in a revision (DEPRECATED use `jj file list`)')
            [CompletionResult]::new('fix', 'fix', [CompletionResultType]::ParameterValue, 'Update files with formatting fixes or other changes')
            [CompletionResult]::new('git', 'git', [CompletionResultType]::ParameterValue, 'Commands for working with Git remotes and the underlying Git repo')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Create a new repo in the given directory')
            [CompletionResult]::new('interdiff', 'interdiff', [CompletionResultType]::ParameterValue, 'Compare the changes of two commits')
            [CompletionResult]::new('log', 'log', [CompletionResultType]::ParameterValue, 'Show revision history')
            [CompletionResult]::new('merge', 'merge', [CompletionResultType]::ParameterValue, 'Merge work from multiple bookmarks (DEPRECATED, use `jj new`)')
            [CompletionResult]::new('move', 'move', [CompletionResultType]::ParameterValue, 'Move changes from one revision into another (DEPRECATED, use `jj squash`)')
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new, empty change and (by default) edit it in the working copy')
            [CompletionResult]::new('next', 'next', [CompletionResultType]::ParameterValue, 'Move the working-copy commit to the child revision')
            [CompletionResult]::new('operation', 'operation', [CompletionResultType]::ParameterValue, 'Commands for working with the operation log')
            [CompletionResult]::new('parallelize', 'parallelize', [CompletionResultType]::ParameterValue, 'Parallelize revisions by making them siblings')
            [CompletionResult]::new('prev', 'prev', [CompletionResultType]::ParameterValue, 'Change the working copy revision relative to the parent revision')
            [CompletionResult]::new('rebase', 'rebase', [CompletionResultType]::ParameterValue, 'Move revisions to different parent(s)')
            [CompletionResult]::new('resolve', 'resolve', [CompletionResultType]::ParameterValue, 'Resolve a conflicted file with an external merge tool')
            [CompletionResult]::new('restore', 'restore', [CompletionResultType]::ParameterValue, 'Restore paths from another revision')
            [CompletionResult]::new('revert', 'revert', [CompletionResultType]::ParameterValue, 'A dummy command that accepts any arguments')
            [CompletionResult]::new('root', 'root', [CompletionResultType]::ParameterValue, 'Show the current workspace root directory')
            [CompletionResult]::new('run', 'run', [CompletionResultType]::ParameterValue, '(**Stub**, does not work yet) Run a command across a set of revisions.')
            [CompletionResult]::new('show', 'show', [CompletionResultType]::ParameterValue, 'Show commit description and changes in a revision')
            [CompletionResult]::new('sparse', 'sparse', [CompletionResultType]::ParameterValue, 'Manage which paths from the working-copy commit are present in the working copy')
            [CompletionResult]::new('split', 'split', [CompletionResultType]::ParameterValue, 'Split a revision in two')
            [CompletionResult]::new('squash', 'squash', [CompletionResultType]::ParameterValue, 'Move changes from a revision into another revision')
            [CompletionResult]::new('status', 'status', [CompletionResultType]::ParameterValue, 'Show high-level repo status')
            [CompletionResult]::new('tag', 'tag', [CompletionResultType]::ParameterValue, 'Manage tags')
            [CompletionResult]::new('util', 'util', [CompletionResultType]::ParameterValue, 'Infrequently used commands such as for generating shell completions')
            [CompletionResult]::new('undo', 'undo', [CompletionResultType]::ParameterValue, 'Undo an operation (shortcut for `jj op undo`)')
            [CompletionResult]::new('unsquash', 'unsquash', [CompletionResultType]::ParameterValue, 'Move changes from a revision''s parent into the revision')
            [CompletionResult]::new('untrack', 'untrack', [CompletionResultType]::ParameterValue, 'Stop tracking specified paths in the working copy')
            [CompletionResult]::new('version', 'version', [CompletionResultType]::ParameterValue, 'Display version information')
            [CompletionResult]::new('workspace', 'workspace', [CompletionResultType]::ParameterValue, 'Commands for working with workspaces')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'jj;help;abandon' {
            break
        }
        'jj;help;backout' {
            break
        }
        'jj;help;bookmark' {
            [CompletionResult]::new('create', 'create', [CompletionResultType]::ParameterValue, 'Create a new bookmark')
            [CompletionResult]::new('delete', 'delete', [CompletionResultType]::ParameterValue, 'Delete an existing bookmark and propagate the deletion to remotes on the next push')
            [CompletionResult]::new('forget', 'forget', [CompletionResultType]::ParameterValue, 'Forget everything about a bookmark, including its local and remote targets')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List bookmarks and their targets')
            [CompletionResult]::new('move', 'move', [CompletionResultType]::ParameterValue, 'Move existing bookmarks to target revision')
            [CompletionResult]::new('rename', 'rename', [CompletionResultType]::ParameterValue, 'Rename `old` bookmark name to `new` bookmark name')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Create or update a bookmark to point to a certain commit')
            [CompletionResult]::new('track', 'track', [CompletionResultType]::ParameterValue, 'Start tracking given remote bookmarks')
            [CompletionResult]::new('untrack', 'untrack', [CompletionResultType]::ParameterValue, 'Stop tracking given remote bookmarks')
            break
        }
        'jj;help;bookmark;create' {
            break
        }
        'jj;help;bookmark;delete' {
            break
        }
        'jj;help;bookmark;forget' {
            break
        }
        'jj;help;bookmark;list' {
            break
        }
        'jj;help;bookmark;move' {
            break
        }
        'jj;help;bookmark;rename' {
            break
        }
        'jj;help;bookmark;set' {
            break
        }
        'jj;help;bookmark;track' {
            break
        }
        'jj;help;bookmark;untrack' {
            break
        }
        'jj;help;branch' {
            [CompletionResult]::new('create', 'create', [CompletionResultType]::ParameterValue, 'Create a new bookmark')
            [CompletionResult]::new('delete', 'delete', [CompletionResultType]::ParameterValue, 'Delete an existing bookmark and propagate the deletion to remotes on the next push')
            [CompletionResult]::new('forget', 'forget', [CompletionResultType]::ParameterValue, 'Forget everything about a bookmark, including its local and remote targets')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List bookmarks and their targets')
            [CompletionResult]::new('move', 'move', [CompletionResultType]::ParameterValue, 'Move existing bookmarks to target revision')
            [CompletionResult]::new('rename', 'rename', [CompletionResultType]::ParameterValue, 'Rename `old` bookmark name to `new` bookmark name')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Create or update a bookmark to point to a certain commit')
            [CompletionResult]::new('track', 'track', [CompletionResultType]::ParameterValue, 'Start tracking given remote bookmarks')
            [CompletionResult]::new('untrack', 'untrack', [CompletionResultType]::ParameterValue, 'Stop tracking given remote bookmarks')
            break
        }
        'jj;help;branch;create' {
            break
        }
        'jj;help;branch;delete' {
            break
        }
        'jj;help;branch;forget' {
            break
        }
        'jj;help;branch;list' {
            break
        }
        'jj;help;branch;move' {
            break
        }
        'jj;help;branch;rename' {
            break
        }
        'jj;help;branch;set' {
            break
        }
        'jj;help;branch;track' {
            break
        }
        'jj;help;branch;untrack' {
            break
        }
        'jj;help;cat' {
            break
        }
        'jj;help;checkout' {
            break
        }
        'jj;help;chmod' {
            break
        }
        'jj;help;commit' {
            break
        }
        'jj;help;config' {
            [CompletionResult]::new('edit', 'edit', [CompletionResultType]::ParameterValue, 'Start an editor on a jj config file')
            [CompletionResult]::new('get', 'get', [CompletionResultType]::ParameterValue, 'Get the value of a given config option.')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List variables set in config file, along with their values')
            [CompletionResult]::new('path', 'path', [CompletionResultType]::ParameterValue, 'Print the path to the config file')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Update config file to set the given option to a given value')
            break
        }
        'jj;help;config;edit' {
            break
        }
        'jj;help;config;get' {
            break
        }
        'jj;help;config;list' {
            break
        }
        'jj;help;config;path' {
            break
        }
        'jj;help;config;set' {
            break
        }
        'jj;help;debug' {
            [CompletionResult]::new('copy-detection', 'copy-detection', [CompletionResultType]::ParameterValue, 'Rebuild commit index')
            [CompletionResult]::new('fileset', 'fileset', [CompletionResultType]::ParameterValue, 'Parse fileset expression')
            [CompletionResult]::new('index', 'index', [CompletionResultType]::ParameterValue, 'Show commit index stats')
            [CompletionResult]::new('local-working-copy', 'local-working-copy', [CompletionResultType]::ParameterValue, 'Show information about the local working copy state')
            [CompletionResult]::new('operation', 'operation', [CompletionResultType]::ParameterValue, 'Show information about an operation and its view')
            [CompletionResult]::new('reindex', 'reindex', [CompletionResultType]::ParameterValue, 'Rebuild commit index')
            [CompletionResult]::new('revset', 'revset', [CompletionResultType]::ParameterValue, 'Evaluate revset to full commit IDs')
            [CompletionResult]::new('snapshot', 'snapshot', [CompletionResultType]::ParameterValue, 'Trigger a snapshot in the op log')
            [CompletionResult]::new('template', 'template', [CompletionResultType]::ParameterValue, 'Parse a template')
            [CompletionResult]::new('tree', 'tree', [CompletionResultType]::ParameterValue, 'List the recursive entries of a tree')
            [CompletionResult]::new('watchman', 'watchman', [CompletionResultType]::ParameterValue, 'watchman')
            [CompletionResult]::new('working-copy', 'working-copy', [CompletionResultType]::ParameterValue, 'Show information about the working copy state')
            break
        }
        'jj;help;debug;copy-detection' {
            break
        }
        'jj;help;debug;fileset' {
            break
        }
        'jj;help;debug;index' {
            break
        }
        'jj;help;debug;local-working-copy' {
            break
        }
        'jj;help;debug;operation' {
            break
        }
        'jj;help;debug;reindex' {
            break
        }
        'jj;help;debug;revset' {
            break
        }
        'jj;help;debug;snapshot' {
            break
        }
        'jj;help;debug;template' {
            break
        }
        'jj;help;debug;tree' {
            break
        }
        'jj;help;debug;watchman' {
            [CompletionResult]::new('status', 'status', [CompletionResultType]::ParameterValue, 'Check whether `watchman` is enabled and whether it''s correctly installed')
            [CompletionResult]::new('query-clock', 'query-clock', [CompletionResultType]::ParameterValue, 'query-clock')
            [CompletionResult]::new('query-changed-files', 'query-changed-files', [CompletionResultType]::ParameterValue, 'query-changed-files')
            [CompletionResult]::new('reset-clock', 'reset-clock', [CompletionResultType]::ParameterValue, 'reset-clock')
            break
        }
        'jj;help;debug;watchman;status' {
            break
        }
        'jj;help;debug;watchman;query-clock' {
            break
        }
        'jj;help;debug;watchman;query-changed-files' {
            break
        }
        'jj;help;debug;watchman;reset-clock' {
            break
        }
        'jj;help;debug;working-copy' {
            break
        }
        'jj;help;describe' {
            break
        }
        'jj;help;diff' {
            break
        }
        'jj;help;diffedit' {
            break
        }
        'jj;help;duplicate' {
            break
        }
        'jj;help;edit' {
            break
        }
        'jj;help;evolog' {
            break
        }
        'jj;help;file' {
            [CompletionResult]::new('chmod', 'chmod', [CompletionResultType]::ParameterValue, 'Sets or removes the executable bit for paths in the repo')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List files in a revision')
            [CompletionResult]::new('show', 'show', [CompletionResultType]::ParameterValue, 'Print contents of files in a revision')
            [CompletionResult]::new('track', 'track', [CompletionResultType]::ParameterValue, 'Start tracking specified paths in the working copy')
            [CompletionResult]::new('untrack', 'untrack', [CompletionResultType]::ParameterValue, 'Stop tracking specified paths in the working copy')
            break
        }
        'jj;help;file;chmod' {
            break
        }
        'jj;help;file;list' {
            break
        }
        'jj;help;file;show' {
            break
        }
        'jj;help;file;track' {
            break
        }
        'jj;help;file;untrack' {
            break
        }
        'jj;help;files' {
            break
        }
        'jj;help;fix' {
            break
        }
        'jj;help;git' {
            [CompletionResult]::new('clone', 'clone', [CompletionResultType]::ParameterValue, 'Create a new repo backed by a clone of a Git repo')
            [CompletionResult]::new('export', 'export', [CompletionResultType]::ParameterValue, 'Update the underlying Git repo with changes made in the repo')
            [CompletionResult]::new('fetch', 'fetch', [CompletionResultType]::ParameterValue, 'Fetch from a Git remote')
            [CompletionResult]::new('import', 'import', [CompletionResultType]::ParameterValue, 'Update repo with changes made in the underlying Git repo')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Create a new Git backed repo')
            [CompletionResult]::new('push', 'push', [CompletionResultType]::ParameterValue, 'Push to a Git remote')
            [CompletionResult]::new('remote', 'remote', [CompletionResultType]::ParameterValue, 'Manage Git remotes')
            [CompletionResult]::new('submodule', 'submodule', [CompletionResultType]::ParameterValue, 'FOR INTERNAL USE ONLY Interact with git submodules')
            break
        }
        'jj;help;git;clone' {
            break
        }
        'jj;help;git;export' {
            break
        }
        'jj;help;git;fetch' {
            break
        }
        'jj;help;git;import' {
            break
        }
        'jj;help;git;init' {
            break
        }
        'jj;help;git;push' {
            break
        }
        'jj;help;git;remote' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a Git remote')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List Git remotes')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove a Git remote and forget its bookmarks')
            [CompletionResult]::new('rename', 'rename', [CompletionResultType]::ParameterValue, 'Rename a Git remote')
            [CompletionResult]::new('set-url', 'set-url', [CompletionResultType]::ParameterValue, 'Set the URL of a Git remote')
            break
        }
        'jj;help;git;remote;add' {
            break
        }
        'jj;help;git;remote;list' {
            break
        }
        'jj;help;git;remote;remove' {
            break
        }
        'jj;help;git;remote;rename' {
            break
        }
        'jj;help;git;remote;set-url' {
            break
        }
        'jj;help;git;submodule' {
            [CompletionResult]::new('print-gitmodules', 'print-gitmodules', [CompletionResultType]::ParameterValue, 'Print the relevant contents from .gitmodules. For debugging purposes only')
            break
        }
        'jj;help;git;submodule;print-gitmodules' {
            break
        }
        'jj;help;init' {
            break
        }
        'jj;help;interdiff' {
            break
        }
        'jj;help;log' {
            break
        }
        'jj;help;merge' {
            break
        }
        'jj;help;move' {
            break
        }
        'jj;help;new' {
            break
        }
        'jj;help;next' {
            break
        }
        'jj;help;operation' {
            [CompletionResult]::new('abandon', 'abandon', [CompletionResultType]::ParameterValue, 'Abandon operation history')
            [CompletionResult]::new('diff', 'diff', [CompletionResultType]::ParameterValue, 'Compare changes to the repository between two operations')
            [CompletionResult]::new('log', 'log', [CompletionResultType]::ParameterValue, 'Show the operation log')
            [CompletionResult]::new('restore', 'restore', [CompletionResultType]::ParameterValue, 'Create a new operation that restores the repo to an earlier state')
            [CompletionResult]::new('show', 'show', [CompletionResultType]::ParameterValue, 'Show changes to the repository in an operation')
            [CompletionResult]::new('undo', 'undo', [CompletionResultType]::ParameterValue, 'Create a new operation that undoes an earlier operation')
            break
        }
        'jj;help;operation;abandon' {
            break
        }
        'jj;help;operation;diff' {
            break
        }
        'jj;help;operation;log' {
            break
        }
        'jj;help;operation;restore' {
            break
        }
        'jj;help;operation;show' {
            break
        }
        'jj;help;operation;undo' {
            break
        }
        'jj;help;parallelize' {
            break
        }
        'jj;help;prev' {
            break
        }
        'jj;help;rebase' {
            break
        }
        'jj;help;resolve' {
            break
        }
        'jj;help;restore' {
            break
        }
        'jj;help;revert' {
            break
        }
        'jj;help;root' {
            break
        }
        'jj;help;run' {
            break
        }
        'jj;help;show' {
            break
        }
        'jj;help;sparse' {
            [CompletionResult]::new('edit', 'edit', [CompletionResultType]::ParameterValue, 'Start an editor to update the patterns that are present in the working copy')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List the patterns that are currently present in the working copy')
            [CompletionResult]::new('reset', 'reset', [CompletionResultType]::ParameterValue, 'Reset the patterns to include all files in the working copy')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Update the patterns that are present in the working copy')
            break
        }
        'jj;help;sparse;edit' {
            break
        }
        'jj;help;sparse;list' {
            break
        }
        'jj;help;sparse;reset' {
            break
        }
        'jj;help;sparse;set' {
            break
        }
        'jj;help;split' {
            break
        }
        'jj;help;squash' {
            break
        }
        'jj;help;status' {
            break
        }
        'jj;help;tag' {
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List tags')
            break
        }
        'jj;help;tag;list' {
            break
        }
        'jj;help;util' {
            [CompletionResult]::new('completion', 'completion', [CompletionResultType]::ParameterValue, 'Print a command-line-completion script')
            [CompletionResult]::new('gc', 'gc', [CompletionResultType]::ParameterValue, 'Run backend-dependent garbage collection')
            [CompletionResult]::new('mangen', 'mangen', [CompletionResultType]::ParameterValue, 'Print a ROFF (manpage)')
            [CompletionResult]::new('markdown-help', 'markdown-help', [CompletionResultType]::ParameterValue, 'Print the CLI help for all subcommands in Markdown')
            [CompletionResult]::new('config-schema', 'config-schema', [CompletionResultType]::ParameterValue, 'Print the JSON schema for the jj TOML config format')
            break
        }
        'jj;help;util;completion' {
            break
        }
        'jj;help;util;gc' {
            break
        }
        'jj;help;util;mangen' {
            break
        }
        'jj;help;util;markdown-help' {
            break
        }
        'jj;help;util;config-schema' {
            break
        }
        'jj;help;undo' {
            break
        }
        'jj;help;unsquash' {
            break
        }
        'jj;help;untrack' {
            break
        }
        'jj;help;version' {
            break
        }
        'jj;help;workspace' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a workspace')
            [CompletionResult]::new('forget', 'forget', [CompletionResultType]::ParameterValue, 'Stop tracking a workspace''s working-copy commit in the repo')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List workspaces')
            [CompletionResult]::new('rename', 'rename', [CompletionResultType]::ParameterValue, 'Renames the current workspace')
            [CompletionResult]::new('root', 'root', [CompletionResultType]::ParameterValue, 'Show the current workspace root directory')
            [CompletionResult]::new('update-stale', 'update-stale', [CompletionResultType]::ParameterValue, 'Update a workspace that has become stale')
            break
        }
        'jj;help;workspace;add' {
            break
        }
        'jj;help;workspace;forget' {
            break
        }
        'jj;help;workspace;list' {
            break
        }
        'jj;help;workspace;rename' {
            break
        }
        'jj;help;workspace;root' {
            break
        }
        'jj;help;workspace;update-stale' {
            break
        }
        'jj;help;help' {
            break
        }
    })

    $completions.Where{ $_.CompletionText -like "$wordToComplete*" } |
        Sort-Object -Property ListItemText
}
