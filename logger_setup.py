import logging
from pathlib import Path


home_directory = Path.home()  # home dir of user; platform independent
log_directory = home_directory / ".util_log"  # log directory in home
home_log_path = log_directory / "file_org.log"  # Define log file path

"""
Inherits from logging.Handler and overrides emit method.
Unused  at the moment but will be used later.
"""


# Not yet used, but will be used later once Logger is more complex
class SeparatorLine(logging.Handler):
    def __init__(self, log_file):
        super().__init__()
        self.log_file = (
            log_file  # Store log file path; Got this part from stackOverflow
        )

    def emit(self, record):
        with open(self.log_file, "a") as f:
            f.write("\n" + "-" * 100 + "\n")


def setup_logging():
    """
    Set up logging configuration. Make it reusable for other scripts.
    This function creates a log directory in the user's home directory
    and sets up a log file to record events.
    """

    if not log_directory.exists():  # Check if log directory exists
        log_directory.mkdir(parents=True, exist_ok=True)  # Create it if not

    # Set up basic logging configuration
    logging.basicConfig(
        level=logging.INFO,
        filename=str(home_log_path),
        # Include date and time
        format="%(asctime)s - %(levelname)s - %(message)s",
        datefmt="%Y-%m-%d_%H-%M-%S",  # Specify the date and time format
        handlers=[
            logging.FileHandler(str(home_log_path)),  # Stream log to file
            logging.StreamHandler(),  # Stream log to STDOUT as well
        ],
    )

    with open(home_log_path, "a") as f:
        f.write("\n" + "-" * 100 + "\n")
