class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.244.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.244.0/snyk-macos"
    sha256 "cef49e6f66416f020ef7762685522a32841a964dd0a7688a11dc0de05e383a35"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.244.0/snyk-linux"
    sha256 "d6771cecd9feb46861acb90b4f7062aa5f3d6fc269aa4c18d4282c4f2851b437"
  end

  def install
    original = OS.linux? ? "snyk-linux" : "snyk-macos"
    mv original, "snyk"
    bin.install "snyk"
  end

  test do
    system "#{bin}/snyk --version"
  end
end
