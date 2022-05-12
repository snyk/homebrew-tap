class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.927.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.927.0/snyk-macos"
    sha256 "4619536b837f853dab0f0d5725b6f31c46b14fb5bf58b1b3fb53ba38c931a417"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.927.0/snyk-linux"
    sha256 "50098591a30525f6d94e4382a79e64e559e96eb9b9035dfea5622dac9b474cfe"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
