# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class Lazyollama < Formula
    desc "A lazy way to manage Ollama models" # Short description
    homepage "https://github.com/webmatze/lazyollama" # Project homepage
    url "https://github.com/webmatze/lazyollama/archive/refs/tags/v0.1.0.tar.gz" # URL to the source tarball of a specific release
    sha256 "d709a6d06fe0ff6a7f21f53dd37e3b727bdfc319aec963962cc0a68c5c8f927c" # SHA256 hash of the tarball
    license "MIT" # Or your chosen license
  
    # Dependencies
    depends_on "rust" => :build # We need the Rust toolchain to build
  
    def install
      # Build the project using Cargo
      # The --locked flag ensures Cargo.lock is used, for reproducible builds
      system "cargo", "build", "--release", "--locked", "--bin", "lazyollama"
  
      # Install the built binary into Homebrew's binary directory
      bin.install "target/release/lazyollama"
  
      # Optional: Install other assets like man pages, completions, etc.
      # man1.install "docs/lazyollama.1" # Example for man page
      # bash_completion.install "completions/lazyollama.bash" # Example for bash completions
      # zsh_completion.install "completions/_lazyollama" # Example for zsh completions
      # fish_completion.install "completions/lazyollama.fish" # Example for fish completions
    end
  
    test do
      # Basic test to ensure the binary runs and outputs something expected
      # For example, check if it outputs the version number
      # Replace "0.1.0" with the actual version string your app outputs
      assert_match "lazyollama 0.1.0", shell_output("#{bin}/lazyollama --version")
      # Or a more functional test if applicable
      # system "#{bin}/lazyollama", "--help"
    end
  end