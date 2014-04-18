CXX_FLAGS = ['-std=c++11',
             '-Wc++98-compact',
             '-fexceptions',
             '-x', 'c++',
             ]

def FlagsForFile(filename, **kwargs):
    return {'flags': CXX_FLAGS, 'do_cache': True}

