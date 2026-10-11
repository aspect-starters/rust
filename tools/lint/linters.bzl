"Define linter aspects"

load("@aspect_rules_lint//lint:lint_test.bzl", "lint_test")
load("@aspect_rules_lint_rust//:clippy.bzl", "lint_clippy_aspect")

# Clippy reads its binary from the configured Rust toolchain (no binary= needed).
# -Dwarnings promotes warnings to errors so they surface as lint violations.
# Tag a target `noclippy` to exclude it.
clippy = lint_clippy_aspect(
    config = Label("//:.clippy.toml"),
    clippy_flags = ["-Dwarnings"],
)
