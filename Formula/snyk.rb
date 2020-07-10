class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.361.3"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.361.3/snyk-macos"
    sha256 "8ce6b5cbd89c58645dec3b9f092bd1824eccdffc8f13ed0ab1bf0c6dbce56ffa"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.361.3/snyk-linux"
    sha256 "491abf2be0d2523067a4833e9946667faf670a9b8374b85d338c6109618f5009"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
