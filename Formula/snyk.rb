class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1011.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1011.0/snyk-macos"
    sha256 "7434167f0c41c8b9f630f64869a999aa5e0595319b421e6930406b0fed6fed36"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1011.0/snyk-linux"
    sha256 "aed01a3d8bc06d099199e0df523a0c52a890b858ccbe085e417078621053e273"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
