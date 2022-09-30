class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1017.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1017.0/snyk-macos"
    sha256 "f61506bf7fdbb1ac97a7ad104e2573f21fcf29a699956a5621283f380392129d"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1017.0/snyk-linux"
    sha256 "139b5bd80463123a385b316fa1155359e8ff63279e6c04d8879183be5ca32e4a"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
