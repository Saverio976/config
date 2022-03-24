def Settings( **kwargs ):
    sttings = {
        'flags': [
            '-x',
            'c',
            '-Ilib/include',
            '-Iinclude',
            '-I../include',
            '-I../lib/include',
            '-Ilib/includes',
            '-Iincludes',
            '-I../includes',
            '-I../lib/includes',
            '-Ilib/libbgs/include',
            '-Igenerator/include',
            '-Isolver/include',
            '-Wall',
            '-Wextra',
            '-Wpedantic'
        ],
    }
    return sttings
