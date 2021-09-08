class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.698.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.698.0/snyk-macos"
    sha256 "a58f13aba90e0fa841cc7cb85fdbf017fe8ec1f0f1d8a553c1c46c732acc49f0"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.698.0/snyk-linux"
    sha256 "0853ca81367e899d75878e49d432f9be9e722fa4dc7660f3c8e3077403534dac"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
