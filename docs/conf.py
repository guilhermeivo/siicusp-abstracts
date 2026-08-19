project = "siicusp-abstracts"

extensions = [
    "sphinx.ext.mathjax",
]

html_theme = "alabaster"

html_sidebars = {
    "**": [],
}

html_static_path = ["_static"]
html_css_files = [
    'custom.css',
]

html_context = {
    "metatags": """
        <meta name="generator" content="Sphinx Documentation">
    """
}

html_theme_options = {
    "show_powered_by": False,
}

import shutil
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
PDF_DIR = ROOT / "dist" / "siicusp-abstracts"
STATIC_DIR = Path(__file__).parent / "_build" / "html"

STATIC_DIR.mkdir(parents=True, exist_ok=True)

for pdf in [ "siicusp-abstracts-doc.pdf" ]:
    shutil.copy2(PDF_DIR / pdf, STATIC_DIR / pdf)
