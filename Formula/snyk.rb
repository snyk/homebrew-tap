class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1056.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1056.0/snyk-macos"
    sha256 "72e6364d1bd733d78f16b771cda17c9d856318840957633c1e5239bbd3ff8a72"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1056.0/snyk-linux"
    sha256 "5bb2bec8f7e640c4a8d0fbeaee90be662d416929f7a5eb1fe046293bf5339e8a"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
