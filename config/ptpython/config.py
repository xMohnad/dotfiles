from ptpython.layout import CompletionVisualisation


def configure(repl):
    repl.complete_while_typing = True
    repl.enable_fuzzy_completion = True

    repl.use_code_colorscheme("solarized-dark")
    repl.completion_visualisation = CompletionVisualisation.MULTI_COLUMN

    repl.use_dark_theme = True
    repl.show_docstring = True

    repl.show_line_numbers = True
    repl.show_status_bar = True


_custom_ui_colorscheme = {
    "prompt": "bg:#eeeeff #000000 bold",
    "status-toolbar": "bg:#ff0000 #000000",
}
