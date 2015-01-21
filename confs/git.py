from installation import Installation

Installation().install(
        name = 'git',
        config = 'gitconfig',
        pre_reqs = [
            ['git']
            ]
        )
