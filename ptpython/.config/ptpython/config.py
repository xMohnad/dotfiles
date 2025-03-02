from prompt_toolkit.output import ColorDepth
from ptpython.layout import CompletionVisualisation
from ptpython.repl import PythonRepl


def configure(repl: PythonRepl):
    """
    Configure the REPL environment based on the desired settings.

    :param repl: The REPL object being configured.
    """
    # Input settings
    repl.vi_mode = True
    repl.paste_mode = True  # Paste mode: on
    repl.complete_while_typing = True  # Complete while typing: on
    repl.complete_private_attributes  # Complete private attrs: Always
    repl.enable_fuzzy_completion = True  # Enable fuzzy completion: on
    repl.enable_dictionary_completion = False  # Dictionary completion: off
    repl.enable_history_search = False  # History search: off
    repl.enable_mouse_support = False  # Mouse support: off
    repl.confirm_exit = True  # Confirm on exit: on
    repl.enable_input_validation = True  # Input validation: on
    repl.enable_auto_suggest = False  # Auto suggestion: off
    repl.accept_input_on_enter = 2  # Accept input on enter: 2

    # Display settings
    repl.completion_visualisation = (
        CompletionVisualisation.MULTI_COLUMN
    )  # Completions: multi-column
    repl.prompt_style = "classic"  # Prompt: classic
    repl.insert_blank_line_after_input = False  # Blank line after input: off
    repl.insert_blank_line_after_output = True  # Blank line after output: on
    repl.show_signature = False  # Show signature: off
    repl.show_docstring = True  # Show docstring: on
    repl.show_line_numbers = True  # Show line numbers: on
    repl.show_meta_enter_message = True  # Show Meta+Enter message: on
    repl.wrap_lines = True  # Wrap lines: on
    repl.show_status_bar = True  # Show status bar: on
    repl.show_sidebar_help = True  # Show sidebar help: on
    repl.highlight_matching_parenthesis = False  # Highlight parenthesis: off
    repl.enable_output_formatting = True  # Reformat output (black): on
    repl.enable_pager = False  # Enable pager for output: off

    # Color settings
    repl.enable_syntax_highlighting = True  # Syntax highlighting: on
    repl.swap_light_and_dark = False  # Swap light/dark colors: off
    repl.use_code_colorscheme("gruvbox-dark")  # Code: gruvbox-dark
    repl.color_depth = ColorDepth.DEPTH_1_BIT  # Color depth: Monochrome
    repl.min_brightness = 0.05  # Min brightness: 0.05
    repl.max_brightness = 1.00  # Max brightness: 1.00
