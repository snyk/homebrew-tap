class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.717.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.717.0/snyk-macos"
    sha256 "328d476140b6cc6254dced93407796f33cc5ad0ee83dd1627b7aa3236542776b"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.717.0/snyk-linux"
    sha256 "9eeb5044778716520b484e44b4a84b3e8ba74ee05303c6efdbac4d5c7908ff3b"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
