class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.369.3"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.369.3/snyk-macos"
    sha256 "7b4974723755434cf5842a5ab635516881ddd8cc4b7a7c123cc26f530e0ffc62"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.369.3/snyk-linux"
    sha256 "e0b9db929e24ebe6d91914926a0e4555ee61d7de86e02640bd1e1020997a2ae7"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
