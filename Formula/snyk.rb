class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.364.2"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.364.2/snyk-macos"
    sha256 "6e9e961b8b350cad973dca9846685e90afc01dd4cb7d075f0ad8f456cdd1575c"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.364.2/snyk-linux"
    sha256 "e5f2498beab75cf10e8e13d3374079939e5c3ee17d82e649ebb04ba0f7b9ff6c"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
