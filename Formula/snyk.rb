class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1095.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1095.0/snyk-macos"
    sha256 "c690f68cf8440ee591047c629c334b00d42ec7c021c382bdad1ba4547757cb2a"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1095.0/snyk-linux"
    sha256 "0f36ac2cd5dab111bbd524580a5e585866e35f99eefe5a952869584a740eb15b"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
