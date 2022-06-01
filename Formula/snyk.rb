class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.945.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.945.0/snyk-macos"
    sha256 "88ccd15c7595ecd03bdde17db1b2c71360185c61651e482b0e3f8f7fc6f80bca"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.945.0/snyk-linux"
    sha256 "adc778f5ae524a7b600e51a72c79681c55fb43dbac7753b5b57c8b6fcf913bfc"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
