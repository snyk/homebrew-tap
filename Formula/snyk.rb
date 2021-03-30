class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.517.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.517.0/snyk-macos"
    sha256 "eef9ef9d6d127b96a55e03ca8d91dcf9c7ba08da22994fc2193c60425c4b8c8b"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.517.0/snyk-linux"
    sha256 "749223f0590c433a5863cffa8bd70b05097c59b5f595746fa447980fba5cc3ac"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
