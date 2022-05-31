class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.942.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.942.0/snyk-macos"
    sha256 "c5fc335841143acf5e6f3223d47c6156d6cc9831e063eacf75142ad134478a01"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.942.0/snyk-linux"
    sha256 "c6ccaec5f658fcc62fc477ee1d51db5b1fe59a01e6ac292570d68bd80175e175"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
