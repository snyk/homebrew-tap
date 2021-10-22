class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.744.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.744.0/snyk-macos"
    sha256 "50c4b863ea264a83a0786fdf2d40b31294070fdc811476d284d5ad20c92ede60"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.744.0/snyk-linux"
    sha256 "be706e47a31775ca513697179fdb1b0971c8ee9b2ca2b5bd8e2dfc407f9ee02e"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
