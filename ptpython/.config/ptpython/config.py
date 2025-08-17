from prompt_toolkit.styles import Style

from ptpython.repl import PythonRepl


def configure(repl: PythonRepl):
    """
    Configure the REPL environment based on the desired settings.

    :param repl: The REPL object being configured.
    """

    repl.install_ui_colorscheme("catppuccin-mocha", _catppuccin_mocha)
    repl.use_ui_colorscheme("catppuccin-mocha")

    # Input settings
    repl.vi_mode = True

    repl.cursor_shape_config = "Modal (vi)"

    repl.show_line_numbers = True

    # Line wrapping. (Instead of horizontal scrolling.)
    repl.wrap_lines = False


_catppuccin_mocha = Style.from_dict(
    {
        # === Prompt ===
        "prompt": "#89b4fa bold",  # Primary prompt
        "prompt.text": "#cdd6f4",  # Normal prompt text
        "prompt.placeholder": "#6c7086 italic",  # Placeholder text
        # === Output ===
        "output.prompt": "#f38ba8 bold",  # Output prefix
        "output.text": "#cdd6f4",  # Normal output
        "output.warning": "bg:#fab387 #1e1e2e",  # Warning messages
        "output.success": "bg:#a6e3a1 #1e1e2e",  # Success messages
        "output.error": "bg:#f38ba8 #1e1e2e",  # Errors
        # === Completion menu ===
        "completion-menu": "bg:#313244 #cdd6f4",  # Menu background
        "completion-menu.completion": "bg:#313244 #cdd6f4",  # Default completion
        "completion-menu.completion.current": "bg:#89b4fa #1e1e2e bold",  # Selected
        "completion-menu.meta.completion": "bg:#313244 #94e2d5",  # Meta info
        "completion-menu.meta.completion.current": "bg:#89b4fa #1e1e2e",  # Selected meta
        "completion-menu.scrollbar.background": "bg:#45475a",
        "completion-menu.scrollbar.button": "bg:#89b4fa",
        # === Signature (function hints) ===
        "signature": "#94e2d5 italic",  # Function signature
        "signature.current-parameter": "bold #f9e2af",  # Highlight current param
        "signature.bracket": "#bac2de",  # Brackets in signature
        # === Search ===
        "search": "bg:#1e1e2e #f5c2e7",
        "search.current": "bg:#f38ba8 #1e1e2e bold",
        "search.match": "bg:#f9e2af #1e1e2e",
        # === Matching brackets ===
        "matching-bracket": "bg:#45475a #f5c2e7 bold",  # Highlighted matching bracket
        # === Toolbar / Status ===
        "status-toolbar": "bg:#1e1e2e #cdd6f4",
        "status-toolbar.text": "#bac2de",
        "status-toolbar.off": "bg:#313244 #6c7086",
        "status-toolbar.on": "bg:#a6e3a1 #1e1e2e bold",
        "status-toolbar.warning": "bg:#fab387 #1e1e2e bold",
        "status-toolbar.error": "bg:#f38ba8 #1e1e2e bold",
        # === Docstrings / help ===
        "docstring": "#a6adc8 italic",
        "docstring.text": "#cdd6f4",
        "docstring.key": "#89b4fa",
        "docstring.value": "#f9e2af",
        # === Line numbers ===
        "line-number": "#6c7086",
        "line-number.current": "#f9e2af bold",
        # === Generic states ===
        "info": "bg:#89dceb #1e1e2e",
        "warning": "bg:#fab387 #1e1e2e",
        "error": "bg:#f38ba8 #1e1e2e",
        "success": "bg:#a6e3a1 #1e1e2e",
    }
)
