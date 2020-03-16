class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.299.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.299.0/snyk-macos"
    sha256 "0f1a06ca3b1e27126fedd4062458a78317b736959ee4efefcfa38a0a45877739"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.299.0/snyk-linux"
    sha256 "4d80a558d3be179dab040ee729ff9ffc5f447c72241b50935de7b50b6920bb5d"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
