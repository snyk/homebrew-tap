class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1172.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1172.0/snyk-macos"
    sha256 "b9ec238e92a545c2b8d2db87b10fc237e6c49f24b1995229610b72571d6193fc"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1172.0/snyk-linux"
    sha256 "ded4fda8d06666734da774b57f3146a030d9d9d0e1bd1b70ad82ee7774aba162"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
