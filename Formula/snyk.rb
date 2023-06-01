class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1170.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1170.0/snyk-macos"
    sha256 "f30ac373ec8a5cbfe525c48f9ae380bb97cdabcae2953da659abb13176d94334"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1170.0/snyk-linux"
    sha256 "ab3776bd2366ad967fa23ea6950bec331f37b04ee199c3ba3333123c4cae6354"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
