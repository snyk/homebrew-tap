class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.385.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.385.0/snyk-macos"
    sha256 "b965fe78c12ffb03b70870941c560dde7441e14449ec24c393369bc3d22d5486"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.385.0/snyk-linux"
    sha256 "feede76741f5a1a19f84b685541e2a904796a766ebd63ee809297f4a16ef5149"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
