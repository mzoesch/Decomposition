class Globals:
    def __init__(self, start_time, args):
        self.args = args

        self.start_time = start_time

        self.time_cursor = self.start_time

        self.env_setup_time = None
        self.analysis_time = None
        self.split_time = None
        self.compile_time = None

        self.split_all_targets = False
        self.split_target = -1

    def get(self, key, default=None):
        return self.args.get(key, default)

    def has(self, key):
        return key in self.args

    def all(self):
        return self.args
