class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.681.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.681.0/snyk-macos"
    sha256 "53eb9316252dd007fc894c38c7957746d2ddee1020dc8a3adf8a37d822d7ec61"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.681.0/snyk-linux"
    sha256 "d38846e21f3d3a5579ce0d86d6548df87872d7c8c61f7ea755e48dd50c1e595b"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
