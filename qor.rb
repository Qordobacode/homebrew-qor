class Qor < Formula
   desc "Cli v2 (using Go)"
   homepage "https://github.com/Qordobacode/Cli-v2"
   url "https://github.com/Qordobacode/Cli-v2/archive/v0.8.0.tar.gz"
   sha256 "95e1c5202586d8cc4119cbe9083c2a1a533a2a285983398135fca5e48260b251"
   head "https://github.com/Qordobacode/Cli-v2.git"

   depends_on "go" => :build

   def install
     ENV["GOPATH"] = buildpath
     src = buildpath/"src/github.com/qordobacode/cli-v2"
     src.install buildpath.children
     src.cd do
       system "go", "build", "-mod", "vendor", "-ldflags", "\"-w -s -X 'github.com/qordobacode/cli-v2/cmd/info.VersionFlag=v0.8.0'\"", "-o", "#{bin}/qor"
       prefix.install_metafiles
     end
   end

   test do
     assert_match "Qordoba Cli v4.0", shell_output("#{bin}/qor --version")
   end
 end