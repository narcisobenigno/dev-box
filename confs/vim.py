import envinfo

from installation import Installation

Installation().install(
        name = 'vim',
        config = 'vimrc',
        pre_reqs = [
            ['macvim', '--env-std --override-system-vim'],
            ['cabal-install'],
            ['ag']
            ],
        post_commands = [
            "vim +PluginInstall +qall",
            "make --directory={}".format(envinfo.home('.vim/bundle/vimproc.vim/'))
            ]
        )
