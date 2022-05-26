class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.940.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.940.0/snyk-macos"
    sha256 "5c4af5fbea36727f58f73c871f8287aaca08a1e8395c6772188b83960ff8de82"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.940.0/snyk-linux"
    sha256 "dd101bb867758b21b56b782c9bef855b0ecc9b719c4fe8ca7d2de5df5f59fb0f"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
