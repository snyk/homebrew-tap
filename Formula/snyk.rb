class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.880.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.880.0/snyk-macos"
    sha256 "2f5ead587e30a2bcba4b3e41b49b5a0f3d7105f1d78c7680997ed009657073a0"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.880.0/snyk-linux"
    sha256 "3709519098f05f0caf0feae551f27a2f3712a80de5796e78fdadb8f8ec1869ae"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
