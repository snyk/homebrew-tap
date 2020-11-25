class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.431.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.431.1/snyk-macos"
    sha256 "bd8b7794780bebbfba3edd9cf512811d26293aaf24117d376b5da272ecee513c"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.431.1/snyk-linux"
    sha256 "10fc7fc60582cb53b89a507b088108ec64e23ad906515eedcde14514246c5d25"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
