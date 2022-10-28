class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1044.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1044.0/snyk-macos"
    sha256 "ab6ac70711ce15b444b367c1bdc474d77cd0ba5415df8d6319e78045876bf232"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1044.0/snyk-linux"
    sha256 "eb419322060947dbdefef701bffafeee93e4da5780bd07f165aff576795efb1e"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
