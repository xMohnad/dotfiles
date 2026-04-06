from ptpython.layout import CompletionVisualisation
from ptpython.repl import PythonRepl

__all__ = ["configure"]


def configure(repl: PythonRepl) -> None:
    """
    Configuration method. This is called during the start-up of ptpython.

    :param repl: `PythonRepl` instance.
    """
    repl.vi_mode = True
    repl.cursor_shape_config = "Modal (vi)"
    repl.swap_light_and_dark = True

    repl.show_signature = True
    repl.show_docstring = True
    repl.enable_history_search = True

    repl.completion_visualisation = CompletionVisualisation.POP_UP
    repl.enable_fuzzy_completion = True
    repl.enable_auto_suggest = True

    repl.wrap_lines = False
    repl.insert_blank_line_after_output = False
    repl.highlight_matching_parenthesis = True

    repl.enable_pager = True
