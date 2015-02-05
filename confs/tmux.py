from installation import Installation

Installation().install(
        name = 'tmux',
        config = 'tmux.conf',
        pre_reqs = [
            ['tmux'],
            ['reattach-to-user-namespace']
            ]
        )
