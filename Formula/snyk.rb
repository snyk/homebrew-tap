class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.856.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.856.0/snyk-macos"
    sha256 "f6a3087162ab00abbf1a282d6dacde2b9970c53467681931d6a7f7b3cf838766"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.856.0/snyk-linux"
    sha256 "f8c31602bf7141de33998eecdbf6555b2e7dced1075fc369e9fdbf2982418f3e"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
