class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.538.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.538.0/snyk-macos"
    sha256 "7642643b8427325186f447b73e9eb4feb26770c51099d74c2fcd1801466740a0"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.538.0/snyk-linux"
    sha256 "3540015fd2575fc0bf12a876bff1401f1cd94af8b4296cbce7034511a07bc92f"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
