class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1123.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1123.0/snyk-macos"
    sha256 "d31d58857d1f8872a738ff12a077afdc44095787953eb7e0144e5fe7299a30e3"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1123.0/snyk-linux"
    sha256 "beab7ca935a549d86e35236f91fa306cc242d54535f4a4c7ce5a7eb736296055"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
