from installation import Installation

def emailenv_warning():
    return [
            'echo',
            '--Please set the GIT_COMMITTER_EMAIL and GIT_AUTHOR_EMAIL variable--'
            ]

Installation().install(
        name = 'git',
        config = 'gitconfig',
        pre_reqs = [
            ['git']
            ],
        post_commands = [
            emailenv_warning()
            ]
        )
