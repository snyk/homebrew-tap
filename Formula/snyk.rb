class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.431.2"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.431.2/snyk-macos"
    sha256 "960c83284fe6d891a767a8ceb4dcdbdbd0ce60b668ae6cb3758edd7394b0841c"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.431.2/snyk-linux"
    sha256 "93e996c5bec631d80a80211ef5d75ecc043ee75c34d8829763c63245517717b4"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
