class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.427.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.427.0/snyk-macos"
    sha256 "90d00e4a4f21e39c773e7ffce76f3a50b4706089e62328242cebddcc576df13a"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.427.0/snyk-linux"
    sha256 "9f18fbe8467f1d42467f5827a84bd389a943d476e4c751cae2ce0471122f1f8d"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
