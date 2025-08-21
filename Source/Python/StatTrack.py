class StatTrack:
    """
    Stats for eval.
    """

    def __init__(self):
        self.original_record_count: int = 0
        self.original_typedef_count: int = 0
        self.original_function_count: int = 0
        self.original_variable_count: int = 0

        """The maximal number of units that were once present but optionally reduced afterwards through merging."""
        self.max_unit_count: int = 0
