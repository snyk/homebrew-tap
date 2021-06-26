class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.646.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.646.0/snyk-macos"
    sha256 "e975c79cec2ce97e9599bf19c8c678e1c9f4f7fcec19fd9d2c36a0af03ed4eb3"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.646.0/snyk-linux"
    sha256 "92df883646916c0aa0b6e3ba17ef2e57bb3742b0e880ae14fc933b9c06a5386f"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
